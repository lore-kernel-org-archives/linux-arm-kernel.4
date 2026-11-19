Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hwV2HGS9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HkwP+zFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IUFFgacHzN97MXo+q0LwU+u1Fe6xl2e8zX5AeLElWI4=; b=hwV2HGS9caYXx41L2TKTTwQtPf
	ccZbRNUuI8i6bNqtTFWjRRVR35Y0k0N9lgE6RwDSVzVossHPc7WFaZsz76yeURcW0pJ8EBgK1JkpZ
	Yg5RQMqfU42NnIEUTQ9g9aPNc8RvXlHLTy3k0d3d+gdzZyR8sR9Da8qiJT22FcuaIYcX2wLqUfbD3
	jCikCmM99li0mJ/1CuPEna+i3MssgoGZt0ahXA11yTp1Y4gurf1/Q1e6FGUh6t41hQUhvlWT0tjHD
	BO3wNx6orfeDAqzJ/2NvIFY0Xg4iG4pbPHDpJSQQfU7ccwTacRWQnerTCBvD+1gouUfBhvP4CXhxD
	98fFIuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Tk-0000000CwBk-3FPx;
	Thu, 19 Nov 2026 18:03:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TZ-0000000Cw4l-1jjG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B17CE1575;
	Thu, 19 Nov 2026 10:03:09 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8F53F959;
	Thu, 19 Nov 2026 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795111392; bh=uaB/qsdTLbGdKAr9WiVe5Xoagmof+U5G2PK/GSIP9kM=;
	h=From:Subject:Date:To:Cc:From;
	b=HkwP+zFD8Wr0aKyOvncCTnIgpbLksfH+iU6CrFH0YVFPBIxr8hN46TNDHnJINU9DK
	 7wqRVFKaz+vjR+KGHK8SoBYnGK4k9w83QRP1RivNZexR+W8mlNkB/61VTX/kj/J/2o
	 kAK2rzZylPd2ztK/M2S3ck9DjzF9LCo4NViwgYag=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH 0/2] Add boot requirements for POE + cleanup booting.rst
Date: Thu, 19 Nov 2026 18:02:41 +0000
Message-Id: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUxFoSriEirg7FopVMiEXdXL
 N/i/wuEApNAm10Q6GBh7xIwz2BctJtJsU2GsigrRGzU5mkw3kd28xAkKmssmqqotSYNqdoCTXx
 +x67/LbtZaYzvBu77AdeNtBhzAAAA
X-Change-ID: 20261119-poe_booting_rst-dbd1b607aaea
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111391; l=1235;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=uaB/qsdTLbGdKAr9WiVe5Xoagmof+U5G2PK/GSIP9kM=;
 b=W0bw/n2GHu7EU2yG1F8fiwmrIre36PDdcfM6uyV0s9YBJDyqDV3bAZflFCYqXXi82cH+WCV+u
 zW6eNsA2RfSCw7L2idgx423e5NiOYEzRfwnAb3BtP/SZdNNJ0I6ea+9
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100313_812979_E1BF24F0 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mark Brown pointed out [1] that my series enabling POE at EL1 does
not update booting.rst. Turns out, we don't even have the
requirements for using POE at EL0 in booting.rst - let's fix that.

While looking at booting.rst, I realised the formatting was broken
in many places. Patch 1 attempts to fix that, while patch 2 actually
adds POE boot requirements.

Various bits generated by Codex (under close supervision :) ).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

[1] https://lore.kernel.org/r/3500936b-4177-4ba0-a9df-7eb9d9d75b0a@sirena.org.uk

---
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kevin Brodsky (2):
      docs: arm64: Fix RST formatting in booting.rst
      docs: arm64: Document booting requirements for POE at EL0

 Documentation/arch/arm64/booting.rst | 160 +++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 73 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261119-poe_booting_rst-dbd1b607aaea


