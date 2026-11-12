Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNTc+yGI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=b1ZkYd+d;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=agjk6xI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OExfF/dB6Z94zSjJS2rq3j9i7FN7X1LzVDOzkFCMV7w=; b=xNTc+yGIQ23+qlslFaiGHP/tt3
	CyiOPBwGEzjQUICUc3JG3NJAeg4dO11WOfeB7qQWGXhgOKFE5vxJsaYKKAYZ8LhaR6LmOuJM1IBa9
	OslpMFB4KKfQgDPTVj8yRCEJmdO0V74rTJ/K1lLjS25SegdH5nj3bOrHmw5A7aa/9wIiT3b1Vbo/e
	nu6fq2BH1NUa0R9csasMxbs7PuSoRhFRrHJVUiovGIzEmepFs4WTH9YJ/al7PKPrzJQZSfSbUG4QM
	AlXo0rX4taLFft/WP44GqhPZHV7WVC3lO+m4ExAjwxTu/bvXTUzzvL8lPTV9STkHEyEamnxTQdmHB
	JJ5e1COg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUm0-0000000A260-2agd;
	Thu, 12 Nov 2026 13:23:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlJ-0000000A1GE-3MXM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OExfF/dB6Z94zSjJS2rq3j9i7FN7X1LzVDOzkFCMV7w=; b=b1ZkYd+dud1PzYFsDOM1Kfxc/e
	uLUwxUOzfN8Boek6GlboFoZgZM8pPrtI0jdVrNtUe9yrjjehHXzDFVfCUI5C0LmjG+ghqw5+W6o/j
	8MbxEZqUe/VjWo+uNoDsk4cnQpR0+IIs1QnPMmo5UllyRGlVlIB0yIR8QQ0wz4GxbRc+N03ezT+LK
	QMpjiQ48o+M/3NmxSVwMejoz6ERHFM6W+gYz36MZhyL7mkRS08/C5bkJp5fUa52xthFn8z/uQlz8s
	sQZzSy+aujri0kbKPqz9Es8gZ1RaSMLFnhoBbXC2+toET7RI20b3Qm1vl4hO7LZwK3pe/N4Rw13ws
	lYmPqApQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlG-0000000AMpa-3SjZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2DEB1BD0;
	Thu, 12 Nov 2026 05:22:37 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 490743F632;
	Thu, 12 Nov 2026 05:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489760; bh=uj7Z6fsp2S7XHDbaSdmER//qRBiAHh/KoyScXNhFMQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agjk6xI+lPu+yuYFR9dsUqauAmeI3xGKbLJ2aLEHd25uYOEABAz9d0hqpreCCWGf6
	 oEvIHDohM/eVCACnpzfHfJrvIm1sgUuXzwnRC4MBY9VTeM4D7eJpmc65nsQqxdxGjT
	 hAEptOZeaHLV1TPDYmSTuFB8K+BbYgx+tp5kYATc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 32/39] arm64: nmi: Add Kconfig for NMI
Date: Thu, 12 Nov 2026 13:20:35 +0000
Message-Id: <20261112132042.129062-33-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132242_937409_B5703D11 
X-CRM114-Status: GOOD (  10.37  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Brown <broonie@kernel.org>

Since NMI handling is in some fairly hot paths we provide a Kconfig
option which allows support to be compiled out when not needed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 4f8b0b294fe1..12cad0650863 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2293,6 +2293,24 @@ endmenu # "ARMv8.7 architectural features"
 config AS_HAS_MOPS
 	def_bool $(as-instr,.arch_extension mops)
 
+menu "ARMv8.8 architectural features"
+
+config ARM64_NMI
+	bool "Enable support for Non-maskable Interrupts (NMI)"
+	default y
+	help
+	  Non-maskable interrupts are an architecture and GIC feature
+	  which allow the system to configure some interrupts to have
+	  superpriority, allowing them to be handled before other interrupts
+	  and masked for shorter periods of time.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the cpu does not implement the feature. It will also be
+	  disabled if pseudo NMIs are enabled at runtime.
+
+endmenu # "ARMv8.8 architectural features"
+
+
 menu "ARMv8.9 architectural features"
 
 config ARM64_POE
-- 
2.34.1


