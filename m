Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRernO7p;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IjbpEBV8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bS1O6gZBZC8eMhEAflyw/nPs5CPcAQAclZg8OIJWUGg=; b=XRernO7pmUPeymn0QOp5gPx17i
	Iione7lg333qEKb7r6r4GEmVoIuXeC04IrwTzLVnspvJj4kcLiHvQ2Y4jfeNziAhs0sjAC+w4ALIy
	2B+PoEC92qWxq/Ezl3PbcAYsmeGDDN533thn4yptKY33V08PmDKhqh/LXz4LqBA3u9WTAALDwycBY
	Zqstj4qvTX6A8XxwYdiY9HTe2IjgyAdDsrowp4GEUZvz2pkqm55/bxclxYytSpVw0ssZIIzmqDpXq
	09V6/6wUSZ81c6iiRGaoOMa2LxZTDhmGwUZRPzYSq03o8z1xDjsRpmQrse1VWGVvyfZUkXPlSC73q
	my5IFT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JT-00000008ZOx-0hKc;
	Wed, 25 Nov 2026 06:17:03 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ig-00000008YZh-1kMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:17 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-386ad819860so564703eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587371; x=1796192171; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bS1O6gZBZC8eMhEAflyw/nPs5CPcAQAclZg8OIJWUGg=;
        b=IjbpEBV8YY0cq80Ajd4vGCc4Y0rLvaTBZ8fpC0P9aVupHoHy8dJQ26MmUOFo8jd17A
         A9nVOU81h1Qvy1hALz7y9t/crePUc47Ob9j96fUv7x9pg8nJuHKqtzi1gfoyE7UZO540
         v7TVHd8bZUUvXB1gQOUrfa9rHCkW9Q7xEarOZPHcZfWJwlb0x9jBU1A9BDxx9m+Rhhu4
         1lD0iZy1FWKCXG3uziwhLQln0JyXT1iOW88WCoYJh8p0XI+89SvEpHaaPsAcCOEDAmki
         Vnc1mb2qxY46/619PO5WKmkKkCBbgTovua9Z1/3vh14Kr+UNr17HciIlrmm0TvpUZilV
         j3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587371; x=1796192171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bS1O6gZBZC8eMhEAflyw/nPs5CPcAQAclZg8OIJWUGg=;
        b=LNxrzueQzknM4OnexOlqyh5N3H0nKg013agADGTjDR3ECy1Lj91H87mn3o3nU7qwVt
         o9BcOZCZwuq/mKreoInZFuCRgNo1f7Ndxmw/5vOx5HB+QTQEPXB1UK9KsnVtvAnozq/x
         54xyb17DNJYCg3bMiOqIJ1Tv7vT7H9ljLdHVB0UUQUN2D8etT+q436TbCMMWEdeQ1+ft
         2SG5PD6XDYaYZbXWN3PrDVQkAH+zHmt0SQPQKFdB2gdWEN9C7NufmuPlQ3WoooakoUBu
         oYK4sDzqM6PA/ptB6ibfAJpKXYkaRIam3WZd1fK0nw4QPEb05DfNDuMB1lE9z0G0D5sp
         DNOQ==
X-Forwarded-Encrypted: i=1; AL+hErEkpJ3nLUK/InkV8ojemBvcJC+VtryHKmD0SjnKEfvt7lOyy59jcOjqnzWbDoqzf4xHwllBIBYIeETxBPDyTSQ3@lists.infradead.org
X-Gm-Message-State: APuU4Z/UeIYEdswcGgyQ3d3QgPo4ZCIBql282U7LYH3nJNW9WrbLMll0
	S4JGNrmfgwqxtyKqQ2yHfsYlI5vBDCv5b4/mNCkEOehrz1PYHV1je1vEH+BU12sX6M0fqUhLN8J
	TvqdCusQCtQ==
X-Received: from dybou2.prod.google.com ([2002:a05:7300:e5c2:b0:384:c70c:3c65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:269e:b0:376:5b99:a816
 with SMTP id 5a478bee46e88-3856c2c3fb4mr17120337eec.3.1795587370674; Tue, 24
 Nov 2026 22:16:10 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:00 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-8-irogers@google.com>
Subject: [RFC PATCH v2 07/30] objtool/ibt: Ignore .eh_frame relocations during
 ENDBR validation
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221614_502371_185A5EE8 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When vmlinux.o is built with -fasynchronous-unwind-tables and
CONFIG_X86_KERNEL_IBT=y, .eh_frame FDE headers contain PC-relative
relocations referencing function start addresses across .text. Because
.eh_frame is read-only unwind metadata rather than executable code or
indirect branch targets, skip .eh_frame* sections during objtool's IBT
relocation validation alongside .orc_unwind_ip and DWARF .debug_*
sections.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15..e631b0da9bad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4644,6 +4644,7 @@ static int validate_ibt(struct objtool_file *file)
 		if ((!strncmp(sec->name, ".discard", 8) &&
 		     strcmp(sec->name, ".discard.ibt_endbr_noseal"))	||
 		    !strncmp(sec->name, ".debug", 6)			||
+		    !strncmp(sec->name, ".eh_frame", 9)			||
 		    !strcmp(sec->name, ".altinstructions")		||
 		    !strcmp(sec->name, ".ibt_endbr_seal")		||
 		    !strcmp(sec->name, ".kcfi_traps")			||
-- 
2.56.1.831.g720f3f5937-goog


