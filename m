Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WfDndVDP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qo9aZBsm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=utOy19qvSktyOdDedVjRTgtyqui/ZqVwdpgBayGUwi8=; b=WfDndVDPvOuT8G
	Pexj5EOVqbZAzt0u8HI63s8Ch4Ng3C68dhxlREqWv8xFxd3ov8WfAeGjKEACjgFXynQr+IyQi7V9/
	VT3ZCE9+1e2s1l1dMzRCJsO6ekYCvBmiY/TTPQsAgbBSEearVcB+CnyNtRnwIqNFumEDQbU7mh2pR
	KpyVfF08yquImhmtOM6alIEyO7YC+j0u1wdTDy0M6IIeP9s8VRJ4qSfi2kcdMQkvwLCEhhbeuBhgr
	QUCNftxfdDqblocXH5MzqC+V4FoZ90T16Ru+SD9rYXI9ZqIb5swJcarf8HrkjBZVSfmhjbCc6rrPf
	d0XqBDSi+x3BvZYmsh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi8t-0000000H1Ru-48j9;
	Sat, 21 Nov 2026 10:16:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi8p-0000000H1RV-4Aoy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 10:16:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1297163f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795256178; x=1795860978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utOy19qvSktyOdDedVjRTgtyqui/ZqVwdpgBayGUwi8=;
        b=Qo9aZBsmy6sQwWMVBxyNbcFk6UKMOmVglO5A/CSFm0ik48WGUEDz6cVA8XK+71RTRT
         e7Cs8Mhwi9IFbWE0JCOYyFDfjJnl5TtN0p6Q/cdru5yz0UyeZ7l11HZqvG1O9HGXopdB
         fV3huRnwW4oz98k4oePvumG/UXN8cGmgwpJdZKBjfhj/Bxjrs8j9jo7YzaRJHEty0V0s
         ScrffM7sSAIKSuPIvGAaHEFqGcB+eDsEVwpV8wElkMZMT6+//PaERbUrck81E61frqeh
         YXa4/jQZa4u/cjpn+iGwl0ns2dZpVYq5XinVh0eQ6jO0wzecz5ZPhMnv7s2bYStECBlr
         BsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256178; x=1795860978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utOy19qvSktyOdDedVjRTgtyqui/ZqVwdpgBayGUwi8=;
        b=yGaUdsNQK94QT5Km+uW2Hs/MN40T1W6WqXZdAh+N41csTPp78UZFwQGBgYXTiLC/+G
         c8fPT7TjsS28gFsD7zHuFkdktJQ4pFOKBzkd70yFxQLiSDv0s6QE8R6FOoATUuCOc+qw
         OQBgpRSum0+hcF/vxCXg9f3T7UqgQcLPW7TfpoaTjIvFY7KeQF5tYVhh6peSl9klejYB
         Oc1thVoMP6kuPwVMDl2dGjeLjQfKmqFKHjGvv/8ZPVgQdckVB2btT+RuRqVNXIj49yEm
         QRSdL3zJO04IXdFsRKhIMQ8LGcSp91I7IQgeSqmu8OP3n/a4Mry66jSAgoTZBARneNnt
         WaFw==
X-Forwarded-Encrypted: i=1; AL+hErGqW04R3NBrCH46IBuT/Uk/sm7gAY2z2mumcGtCQPqcM9LmIcBjxUNFLDG1upzm4X2G/wsiKiwHyM/Nd1WDCdoS@lists.infradead.org
X-Gm-Message-State: APuU4Z9uf6ZKcjDSuTWadm8f68VjAvpagJWaOJ0Ri9YWzexzXemZCBIs
	BqhZJMAecGrMBlIFljIZZg6oPEUQDXCN6QrTVButlEm42htLvRdeBU41bXTDmw==
X-Gm-Gg: AZFdTZenmtfQ5eKy4gU4xHLkV/5inYnxHM/T5Ac2vZOHYaO7bCcQ+bfKy/bsiUtRtW4
	3QU953DCxshWyiQFSBn1IWwq4QmRDP1NvMJXsbEhZS8698iyj+kmecn29YIvC4PWsq7ezMpayi/
	yAmG0pgL/yTaWwq0Cwmd0olHatSMh7sof2X1NyyIPUyBuN8tOkLjo5AZYZSexHrtTvAMZTxatsl
	vykRz17yweqXb+skLs9vduhrQEYGlMeaWHWLnR6bWdXM4ptZC/xtJmD/mKZNfwWBk2vOJNu2UvW
	KE4r1UPOQ3GbSU2NR/+grFSBOlfRnb3jWU/XwPJNKbAJHzZhW1S1wKfSZbYRb2KKdwZRcjSUoE0
	TZyznDyUfC2vX5lGSzu9KK3mXDl1IrExnYeuOImFjecb9YffEKCZDcjGo8VcPsg7+CXf7pDmENt
	Ll3BNNaxmzoVM3qIqA8LgsVH2iXB9M8x1a/33nOJINav9pqBo1fM1Eb59viU0FQSlVTwVQD+Wdc
	3fe8aXuZKi97AGp1dCT4tJV7cPjheIw0iQmV9ouzUoT+VhOP3qsStm3zMmU5k7MNxXMH3a7wQl+
	tC3kMvmjqFxoNhMU84IXMEuyIkUKDZYo3MUIO0Qi
X-Received: by 2002:a05:6000:22c8:b0:4a6:bc53:2466 with SMTP id ffacd0b85a97d-4abb0d52547mr12121646f8f.16.1795256177780;
        Sat, 21 Nov 2026 02:16:17 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm10396015f8f.30.2026.11.21.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:16:16 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: zx279128s pinmux questions
Date: Sat, 21 Nov 2026 11:16:15 +0100
Message-Id: <20261121101615.3726892-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261121092601.1543468-1-isasmendi.agus@gmail.com>
References: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com> <20261121092601.1543468-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_021620_515909_C2D771E3 
X-CRM114-Status: GOOD (  10.23  )
X-Spam-Score: -2.1 (--)
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

Hi Stefan,

A follow-up to my earlier mail, with the details behind it.  No mux
field on the ZX279128S controls more than one pin: each pin has its
own field, so nothing is linked together and a pinmux = <pin function>
binding works for us too.  The fields are just not in pin order, so the
driver needs a table of where each pin's field is.  This is what we
have so far.

Pin numbers are GPIO numbers; the functions come from the manual's pad
table, listed by mux value (0/1/2/3).  For 1-bit fields, 0 = function
and 1 = GPIO.  The last column says where each position comes from:
"hw" = flipped on my board and seen on the GPIO input, "code" = written
by the stock U-Boot or kernel for that pin, "inf" = inferred from the
manual and the board tables, not tested.

Mux, 0x94200000:

  reg   bits       pins       functions                         src
  0x00  2k+1:2k    GPIO0-10   e.g. GPIO2 = JTAG_TDO/SIM_VCCEN/   hw: 1-3,8,9
                   (k=0..10)  UART1_TXD/GPIO2                    code: 5
                                                                 inf: rest
  0x00  22, 23     GPIO36,37  UART0 RXD, TXD                     hw
  0x00  24..27     GPIO38-41  I2C0 SCL/SDA, I2C1 SCL/SDA         hw
  0x04  1:0        GPIO11     SSP0_FS0                           inf
  0x04  3:2        GPIO12     SSP0_FS1                           hw
  0x04  5:4        GPIO14     SSP0_FS3                           hw
  0x04  7:6        GPIO15     SSP0_RXD                           code
  0x04  9:8        GPIO16     SSP0_TXD                           hw
  0x04  11:10..    GPIO17-21  SSP0_SCLK, PCM CLK/FS/TXD/RXD      inf
        19:18
  0x04  21:20      GPIO13     SSP0_FS2                           hw
  0x04  23:22      GPIO42     RGMII TXCLK                        inf
  0x08  2k+1:2k    GPIO22-35  NAND ADQ0-7 and control pads;      code
        (k=0..13)             1 on the control pads = SPI-NAND
  0x0c  0          GPIO53     PCIE0_nCLKREQ                      hw
  0x0c  1          GPIO54     PCIE1_RSTB                         code
  0x0c  2          GPIO55     PCIE1_nCLKREQ                      hw
  0x0c  3..6       GPIO56-59  GEPHY LED0-3                       hw
  0x0c  7..11      GPIO43-47  RGMII TXCTL, TXD0-3                inf
  0x0c  12, 13     GPIO50,51  TX/RX_PWRDOWN                      hw
  0x0c  14         GPIO52     PCIE0_RSTB                         code
  0x0c  15, 16     GPIO48,49  TX_SD, RX_LOS                      hw
  0x0c  18         GPIO60     SDMMC_DATA0                        hw
  0x0c  19, 20     GPIO61,62  MDC0, MDIO0                        code
  0x0c  21         GPIO63     STRAP_NAND_PAGE_SIZE0              hw

Unknown: 0x00 bits 31:28, 0x04 bits 27:24, 0x08 bits 31:28, 0x0c
bit 17.

0x30..0x38, one bit per pin: bit n of 0x30 is GPIO n (hw for 1, 2, 3,
8, 9, 12-14, 28, 29); in 0x34 the order is mostly GPIO 32+n but shifts
by one from bit 18.  Clearing a bit makes the pin read 0.

0x50..0xa4, 6-bit pad config, five fields per word.  Three are tested
(0x54 field 0 = GPIO6, 0x60 fields 0 and 2 = GPIO18 and GPIO21).  The
rest seem to follow the manual's pad order (JTAG at 0x50, UART0 at
0x74, I2C at 0x78, PCIe at 0x94/0x98, ...), which puts the pull-ups on
UART0_RXD, the I2C pads, the PCIe nCLKREQ pins and JTAG.  Bits 1:0 are
the pull (01 up, 10 down); bits 5:2 are unknown.

Agustin

