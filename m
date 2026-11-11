Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A572606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fXEOs40x;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n7MvweOx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=; b=fXEOs40xAHY16rxA2bHs9QnF3J
	N8JJoeDSRL7AZTMi6yRLQyUcLwdgEdNqTvQpufEcclQkDKu4Zk2q5mPpbbiE22T4/Vddph6wdBbOz
	HI95N6RT0n16deSpsrWq6zWOidtjdhEfzSE0KyvIy1IhNAuOO1l8Dn/t5MWfMoIzFNQ4RpzOc+rHc
	o9EZr5qOe0O67lLqhJQceumWYVo6B+dBtgcdFDI2ixFxdT8Z3dy2pHTWDy4PEZHIBOoB+wqZGWdt1
	uY+gMeVnVC1i8ifUezc0ZURyRnbyveAwjc3xGwTiWpVfcidNC/LkFLLzEqvkpgNsN45TmFixiBstU
	23FjITVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tQ-00000006YDd-3Pra;
	Wed, 11 Nov 2026 11:53:32 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tO-00000006YBH-1Kb8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:31 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso20374595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398008; x=1795002808; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=;
        b=n7MvweOxrvDKDHnR6XmknZV9Y3cy9ax3aunOBpTmAX1zQYZYIsfvg1Y702KZ6ozkQ0
         eI1SKGmp0GzNp5goGxG0oA0VXkbojMzKFYQIstbDoZdR8efnj0+CAwMZJKMF+lcF8Plb
         j2l2jMGHWZTg3TWqXIq4dKM/pbZ0nl0CVfnQUdMCMje0q5HHZSk+TC5pQ5toFPPgkxoC
         WhDLZdBTPlr46YTsglOrMCjZdVKWrW1l5dWaUkGWCvunQUeG0jHbw7k4H80C8iIu/NGF
         X5pH8Ixpvrese0/KcSaQ7b0u9cEWt3Pw9T5bOtPz7O/ph4z8jSEBy1qBVHgWht0SlOj4
         64Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398008; x=1795002808;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=;
        b=I7RNr7R+/2MDpJHSeQ4mif3MlzOebviu1yZwVZSNtA85y6WvgwM5wLU0zCKxhWz58w
         0GHp/lYNaeiq1uK4M5P2prjdHTFMVDBhy8fTzP41omr6OVBHaXM2tRUMgmgUSzZZzdPa
         Lug0kP/YPwJPxAt4vEUrfEunogoG8fCAg3cfit78s0ePGgtz7cZNuIF17OB9wFTR/Ek9
         2V1YCOJiF9Vh9J53FRSkD8NpSQQ9bxiTQxupMocWr8Yusv3mo/ho7EXFFyvUmemgw5Vc
         wLDXQ+qQ4NgTBxpF8L68SKPhpfFYXhq0OLosgz57U0tRN7Vzg6qHuP6hNVtpQlcoBhQV
         t/uQ==
X-Gm-Message-State: APuU4Z8J6Dg8rIeynEiHUoUCWucv7tPJ1JEOTXtblQGCc8ULv8zotadp
	iTtlu+fTkcN3hYIuq1EtiToBP5QAj5T+ya9Srsb/PIhbJxZFxlEwx4572JLipHh5XVDDYYI02kK
	pYmdzOabpJG+HSkUabgK92/D2t4dg4SmmCwIXN/uVb2y7/jn1T37sUina8rvsQt68IpjAwvIrBl
	J7eL2jS2Gg+hg/2TG7XSAPf9aLVFJRmAiNWWNdNM/zBLFh
X-Received: from wmfx22.prod.google.com ([2002:a05:600c:2d16:b0:4a2:677:24c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e545:b0:4a1:ac66:6059
 with SMTP id 5b1f17b1804b1-4ba093bdb35mr28910225e9.26.1794398007452; Wed, 11
 Nov 2026 03:53:27 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:04 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=ardb@kernel.org;
 h=from:subject; bh=hPzIZ0furKnDG7EPgK7IrCj0fkSQAyuPiZdPs8OxyD8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuML36Pb8Gx7ih4zYXnrcsNqw2JnD2jY59knS4/fz6
 iZ1HHnYUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbySJ6R4fm5K6yPPrPFMx/v
 NzKrXpVxc2JBzpIz7hfUttU+/X5p3kWGf/aPFf1Oqm5+9OvJ+kjj+GO3rDfouoY+OGjB9nz5Zj/ RiywA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-9-ardb+git@google.com>
Subject: [PATCH 0/7] Lenovo Yoga C630 (sdm845) fixes
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035330_366768_EC21C88F 
X-CRM114-Status: GOOD (  10.25  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

I went down a rabbit hole with Claude to finally get my Yoga c630
working properly at EL2 (minus audio).

This series does not cover all of that, but it contains some of the
fixes I picked up along the way that are unrelated to EL2 but were
needed nonetheless so I am sending those out first.

The EL2 changes themselves may not be as palatable upstream, as they
hack around the removal of the QHEE hypervisor using slbounce, so they
will be RFC material in any case.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org

Ard Biesheuvel (7):
  arm64: dts: qcom: sdm845: Bump fastrpc shared DMA pool to 32MB for 16k
    pages
  arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge reference
    clock
  arm64: dts: qcom: c630: Enable DisplayPort alt mode
  arm64: dts: qcom: c630: Use the idle states from the ACPI tables
  arm64: dts: qcom: c630: Wait for the touchpad at resume
  platform: arm64: lenovo-yoga-c630: Disable the EC interrupt while
    suspended
  platform: arm64: lenovo-yoga-c630: Expose the keyboard backlight as an
    LED

 arch/arm64/boot/dts/qcom/sdm845.dtsi                 |   4 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  44 ++++--
 drivers/platform/arm64/Kconfig                       |   4 +-
 drivers/platform/arm64/lenovo-yoga-c630.c            | 155 +++++++++++++++++++-
 4 files changed, 190 insertions(+), 17 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.611.g1030f0b940-goog


