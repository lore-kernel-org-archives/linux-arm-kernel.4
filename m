Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678C606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTkLgPLc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtsNJXH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bj8/4t1D3486bMWuOXwhLcAKxLKyES2zSNh6vuKXpeY=; b=KTkLgPLc8f3ZrZ
	HdRwIX1UPwh8kZ8AyB/tZ6wYKrJLb812GzlWZEkEfXd1JqbxNvnXUlFDiSioac642NIQAsiIncGgq
	cFz6BkU3S9EQhPa3BF2gufLJsw2WyaGbNpD/GAVABUAiwBkFDo6kuATFlAShWRya5QT/pdVDQAh77
	YStrgrqYVw4t70dDYNq3v8e160i2aGC4eHBjBLWZM0d2AFHc+Shc7uQDHZpmJn/d0D5BrYJPK771e
	pIc9blLzWYOuPlWzospWqrQa/m0OmasDTRS2Y1J2Uk5ABqUXp59dk08fd+kKMwnZTNWkS2Rl25f0i
	ejVxVpjbHwEqUFZJwAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRf-0000000CpzC-1OGt;
	Thu, 26 Nov 2026 11:15:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRP-0000000Cpo3-3U1M;
	Thu, 26 Nov 2026 11:15:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 919D645CBF;
	Thu, 26 Nov 2026 11:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18B61F000C0;
	Thu, 26 Nov 2026 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691703;
	bh=bj8/4t1D3486bMWuOXwhLcAKxLKyES2zSNh6vuKXpeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UtsNJXH5LkGbLvmX8h3OWLUUPvo5d1Agxt9hiYQPPnM54LtZfxIJvEkh7mIytiaPL
	 R/iQ8gA7kJPLRFnQ2FHCXHvqEw5yPC6eW6oxNL4Gli3chYbPmwhbjwy2PutbebUGMc
	 R73R+kL6N6mVGWCCB1VsAFs8AB9+g4AyJv+7cH0WQ+PHsw7ExmQ0tVphZP274UDziY
	 3gfWXTO7rOPovoqCNUi+BQdyjUiAqRxeTnYvKTBDnS5fdyx3AoxmmN1YYITXMeU6u5
	 58JA57EHTN+Mt/ar7zYd+kdqSTSqOfYOBW/fd8UrNniZmSKj+/mHWAgxeBE9NdurAa
	 swzGR3b7HpeBA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:16 +0200
Subject: [PATCH RFC v2 03/54] s390/boot: parse boolean parameters like the
 kernel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-generic-set-memory-v0-1-v2-3-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The decompressor has a copy of kstrtobool() that takes only y/n, 1/0 and
on/off. The kernel's kstrtobool() also takes true/false since 0d6ea3ac94ca
("lib/kstrtox.c: add "false"/"true" support to kstrtobool()") and
enabled/disabled since ae5b3500856f ("kstrtox: add support for enabled and
disabled in kstrtobool()").

The decompressor ignores these values, so "cmma=false" leaves CMMA enabled
and "prot_virt=true" does not enable it.

Copy kstrtobool() from lib/kstrtox.c. This also adds the break after the
on/off switch, which only replaces a fall through to the empty default
case.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/boot/string.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/s390/boot/string.c b/arch/s390/boot/string.c
index e4ad196cb720..c12fee2670e3 100644
--- a/arch/s390/boot/string.c
+++ b/arch/s390/boot/string.c
@@ -132,13 +132,21 @@ int kstrtobool(const char *s, bool *res)
 		return -EINVAL;
 
 	switch (s[0]) {
+	case 'e':
+	case 'E':
 	case 'y':
 	case 'Y':
+	case 't':
+	case 'T':
 	case '1':
 		*res = true;
 		return 0;
+	case 'd':
+	case 'D':
 	case 'n':
 	case 'N':
+	case 'f':
+	case 'F':
 	case '0':
 		*res = false;
 		return 0;
@@ -156,6 +164,7 @@ int kstrtobool(const char *s, bool *res)
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}

-- 
2.53.0


