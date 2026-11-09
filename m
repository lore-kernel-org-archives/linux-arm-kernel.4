Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E97606EEB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BMfB8+f;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wxo1v4Xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=; b=1BMfB8+fZzq2OJPzElDylwWy7U
	EOgqnDjqJfL2y0SbqwBzauKdC3BS8ho4PFUnZD8lyf6w2sL2pzNPbcI1o1605V+9VWhO3WmZs6mnX
	lmP+AqnYOGEH5BqP2yBGyWQafhHF0Eve+qzkdVj6gS3OT1ibh8VmjiZXFk+/9TsyhKxgnOIMxvIaQ
	IEJKjKXPHFja5ejZAkMdiV2IM+Ba1xBvaiD+nMsDT1zajKB8Bb0b8V6pFZmqk2erfxsqQUiLqf/7k
	3Acvw2ukHCTCOfGAlhifFKpAw8AyMFrHhpAnQO47r0v9gBOpHq6DgfYp+w6YF+BvW0XTSN5DoWncM
	QgbmMzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHwM-0000000HPg8-3BSs;
	Mon, 09 Nov 2026 05:29:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHwJ-0000000HPfL-3BgF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:29:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso314890a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202147; x=1794806947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=wxo1v4XdA1KAZoL5PDXZuTMgnCUUDNsf5Dv6QnQl3VVKhuEGAkaQDdwOpMyiyN0FJr
         5oima25lDAjs9bgOI2xyCvhm2A6FAcEi79UoNBfumxn5z+s8b3PblLWZtHpsXh5VLpRZ
         yOXtm7/ol7uIm4koa+Ky2LMico7fq2kkxRQy0jGcHN1vt6Au7LbgsJLb5aQJ604dwmFf
         1bGx0A3owmuLz+/ChXr6fooTr5ra5Pv3dQ03SkG1iY/Gv77XIg4ZOpBcYkJws5ITqnAw
         vzkY/AOkzhT1FJr2QLId6vMP4hS0jXlc98gW5WRAKcAB3+D2HoiIaebdUw8Butcq9xDo
         J/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202147; x=1794806947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=QzpwXgmyFTYFHVQkGUxq//qfr+kacWFkl/OJR2xHOBQp49zJx8bZxSssuWGjn7vBjA
         gr2NfCvUd5bf8ybWzHB0D2y/Wnt1cUFwLBIpUpewYC4SZ7jGP9EwlLs2ESEWublwso4F
         4U4uVSbiDAk0LDTsK/aENMljyCI09+sn4dFymAt55WuvHLaSQMvfepu4rRohldNQWwZM
         B5sCuKiTdtiqRVL0BjGaaAz4rsO0ZBu3M2WeBHILTuCPGjPs6Arika3VS8d03kQrDUpj
         hTMypO18fNXdYufG3d/wk542BZfBWLsuxMtb+QSi4blil7zxDSb1l5nwyxfH4UbidX/t
         bPgA==
X-Forwarded-Encrypted: i=1; AL+hErHmgucJcsie5FbC0pqm4g23r1ONftPYWAachX+U7Auf/AT9wUua1JSzXsrIyx1oEjWPBmaINcIZu4KSkIYGABVi@lists.infradead.org
X-Gm-Message-State: APuU4Z+zg24arZiqFzFLQIJ7J7HoV2S9CNMv/OvIBofVtn3zIp3dD/LU
	35egVa1xLWDKDz0OkJAczuAp21Q2l7kWptNSDngd/MbgHYbJHdVA+AoI
X-Gm-Gg: AYBFou2DNFG6nefYgB1Svn77DLUauW89rX+PnwBIEi2Yf0tcddj5zed938NQIHchZqq
	Oh10h3CT2ZHx8995ytFyghdqsE1lLhxdXadKiyUF3f4IhFPO73OFUq12vzgOURjMKBCQfViHHBh
	D4QjP5Iio3fwwVT5CkOR/6+b0asMlQ2bApzV+voR3qB7xAD2REDSMMc+1Q1QoCPOXPW+MdsQ6PP
	2yylCoEVWx3F8pwzQAUaKZGeeDgk8Ogg62tymAPdceZiq6lRCz4DTsgPha8AgN4OgRDIxsUGM+T
	ynSWDAtnk8l0RQhrsQwGoMzfQ0KhkZgHgKiixwftX7J7ehtHqRyHf1+ihoeVUomF3II+vXCBHUs
	4Lc7Z7nCYsptJKvbEmMCkjdqBoHO1i6KmToNSsPZ/N2ofN8oxPOSHTarf6+UhW+QPKAu6JfI/In
	3nFQ3XWefREA3YVEPyLDSIIsjvx6S0V41rJ/BlL0KD+OSeN+vWN/rbKEVDvm0TLIQafy7yOA5WB
	dExaAQXc8u7veonrRQrofzckithg8i0I9OKxr503ccvtiACSFgFLX+q7FPBzzQ84tG42f6SWLG1
	0xHvOD5LHLvyHhbTUBekGPHbrEZ1rUctv7sxq4AycLMbGoCQaETiHf7mcfAjQo7pJC72tdUYtog
	tgcDcWGV9ZyjslBzq6mOGaSUsFfiBk8fHlgEx
X-Received: by 2002:a17:90b:4c88:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3b12d442907mr2821498a91.30.1794202146776;
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Mon,  9 Nov 2026 13:28:58 +0800
Message-Id: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_212907_803426_D842733B 
X-CRM114-Status: GOOD (  12.50  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc1:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 672 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1


