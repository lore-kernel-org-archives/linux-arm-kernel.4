Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kHh5j0lG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXGijeXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=; b=kHh5j0lGzCyvRow17WSfP4/CZG
	T/B6IJqP+fF4dJB2E6ErMCCuVn9HTXoBXWiHyBT8lD37xS9foRBBwd3ECpysPOKSlBe+QOgSadsBO
	Z4/FOhBLdPW6tVk0OGLqZlQl2eP43VzRpEecmRBLAENzFkzmMVSZ1oWgc+mpnQ3LlH657OTb2QLRm
	b6DJ38AVNrlo7rLH5361T2Gp/Xjuh8ELvY1COPboXj0mccVxlgLUbMTDkOOrxN0DT65h9AZmcHChM
	iO+kSb9VsK3CYpjy3qrXYLtlXmxaMsOXWifC2xyZBsgOBh+ciS4EaUY23TCpoX1i59oN1F2m3QKtd
	m2GS1/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmB8-0000000Eoha-2FKq;
	Fri, 27 Nov 2026 02:59:14 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmB6-0000000Eogl-2N3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:59:14 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-33fb4680717so3841717eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748351; x=1796353151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=hXGijeXedblzRkNVJvQRHHyHHkW9SEh492GcQzIGQ1m9P9aE7X00KUgKKlkhXXUs2v
         UBU5J2xdQAgzFTpHgtu7gPdquQi3H4tlWt0iQbF3kxjHAYWj+k5rhBSmnNJJEQKxPAwu
         yW+bqIi5IgUKkpIfDDsuWfNZ3xEh+EaWpJuix7zK0H9MK/yWzdxsnC2IrntU4z1aXRwx
         Q2F/oEYn4YftzPKrMSaHe9G8lwvzQ7KAM8PtPP8CermGBf3Ok0MsVsmI5fmmblytazXm
         bxinGpKlAIr9Zq8Qm0VnFAp1fnOV7NnoF1KSRmmaGj5UawFg+QInqHSZk7dWES3Pz+3d
         lqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748351; x=1796353151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=2Wbd9/+HYN0Lf8ndj5bHAtXApn+vwvSQHY+0t4CxltM4BdO9nppCqcB1Ds3aFKii4O
         CDOIJ1S76233sVOxNs/rLg4d+1UUaOp8VWUY/L2HRxn+YjMqWH5lTOZ+jfveZ0YEzZQD
         WdEI0PbEqypHZ2QO0nbSRFFZ8ku5mUjHtxMii+J9OLLrUimE388sQVH7SLaH1aIVqywY
         O90mCkdZ6JqBaR/1VBZ+rlca+cRIyKlCosba59tzpBor90z9c16N936RU8J1pVtUT0ks
         /5t64qnGw87CpK8jqjrIQHA4JbrWR8sBh14sZuJjX9Q5lUzXrhEQk0BsKTljY1v4/jXg
         IPVA==
X-Forwarded-Encrypted: i=1; AL+hErHAZdl2wBGLsI79+DJocArUeVpHDGJWn2iJl3mGEAmOodYKbG/v7M/aJV42Kc2voicmVr5ei5Ya1NiHsEwVSmru@lists.infradead.org
X-Gm-Message-State: APuU4Z+pQuQN84bRZOOX9atxA0V157o2uacaBwGqVwBSEo+9gZvrNMX1
	nFdOWu6OXRjx7ogEIJjSOV1fQbUIpnYBuP/rqHZccv3CJ8zwRRYBy8RQ
X-Gm-Gg: AZFdTZfkkA428mQ7rslI/K0nGGIBpuo+1i7kulgXAQJrB4faKn1Ja45d5B/jFV3Es8S
	oDS88D7aqCQxy6e0qLjBtC1H5G4KOSIexXD27nu6VigEc22AzhIQmATFESw1dF/KDmSKpJp/7Xf
	L6E1AHVUvrqr8P9cGqEbwYJZ4ynRpdnclnM80viB7BtUgHvJmpKKiSmVBLVpRpOSWRvky59s6W4
	zQtFvaeLJEJP6hZCSLPVp6ncQOjIyNlcH3EPtROgpvcNUQFHypIpUrEBd2QbwOkqgdUiAj8MHUb
	ZAC4MRa6aWlLgPS0YdC4VoF0dBZ0zEj+VfL1F8EAuGYp+UDDu7EF9439eZ1lfp2xoHnwq2iVSFy
	DqA8i/OrcDz07/P7RNxIw0sPYBqdU7f+U8uFnsgYh/+xwaCBWZcyjDSUWdU4nj6Hxr581bd4qSw
	+tL9oSbv8tcqHJh1EGdwQ1TlvWN7q03l1o6O0y1ucNKsrZgLwlYu8yL56DuwOKC4FFlKPoxG3jD
	eJx/762pjCYMjZ+YDPWM2IjNldhRbQKLvYc++xogcfnUTsFjcll8AYm0Rx9bxI5FvhWthalps40
	ADUfED2kLcdBD/LbWfHmurm/mam4oLZhAl2JpNygvtD/iKA=
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr1066918eec.11.1795748351083;
        Thu, 26 Nov 2026 18:59:11 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:10 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 27 Nov 2026 08:28:15 +0530
Message-ID: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_185912_614314_B2725E7D 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Expose permitted AST2600 OTP data through root-only, read-only NVMEM
for BMC bring-up diagnostics comparing raw offsets with reference reads.
The series also describes the SBC's NVMEM-provider role in its binding.

Changes since v3:
- Drop linux/mod_devicetable.h as requested by Uwe Kleine-Koenig;
  linux/platform_device.h already provides the required declaration.
- The binding patch is unchanged.

The previous v3 series passed ARM W=1 and B650D4U/A3 read validation on
upstream-based 7.4-rc1: repeated reads, pair boundaries, 40 concurrent
reads and comparison of a 12-byte range with a vendor-derived reference.
These hardware results are from v3, before the include-only change.

For v4, ARM W=1 driver-object compilation passed. Strict checkpatch
reported zero errors, warnings or checks for the binding patch, and zero
errors/checks with one new-file/MAINTAINERS warning for the driver patch.
The existing ASPEED MAINTAINERS matcher covers the driver.

Previous revision and review:
https://lore.kernel.org/all/20261121034053.39878-1-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

AI assistance was used for driver revisions, validation tooling and patch
text. Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

