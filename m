Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC2606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11ugtthz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4HfjcA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=; b=11ugtthzVd5lS48UChSDGnO6aD
	1aGAYaoTW1Ocg2NaLVoITVyj0JN3huAhuIsEPoETVBr6Dv5t0FRqK1V+N9MyPOXe4CjTTR9n3xM5M
	FewfXcIIK7CSNl6dA6E3SmMc5HMchuoYb9HeFyFAOtSoBBdfsayZYauz7ze1OOOYm9kDqPCz0PVyT
	ylT5ABYgNrtDNAuWDiahRakePfDR/36QnhP+arzJdg5gVfdD+7RxBBlaiSN3s0XY4o4cfVYrFdA8R
	JOvL18WhvqTxbgUa0AVm+iP+BtfGIo+jrTXjXnQHHcgCYJ5lN41up0s5IggePD/+RvBu18L3/QtKJ
	I+Po65Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqTM-00000004m8o-3EY8;
	Tue, 10 Nov 2026 18:21:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqTJ-00000004m8B-2BIR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:21:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so12149915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334887; x=1794939687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=z4HfjcA+h9W/V9mm7JwcJezGBuAiDECCQwOQAqn4Be+nHaYwB9RfNGmIb1B3Phya0p
         9Zn40WMvrNH6HR2cBOPDD8UkREhvDuDY+J+8PLXFxLxuS2hJxWjTZdG4L3kO0D8bgvLf
         PydPlrwGQVve2TMra1UqzNsPp9BxPb92B03ktG8JTDMaSAelQcIEPixIyOaMYCkaq3IQ
         B3AB9THf+72XGxSciULgYTUJIcXq+K7/0VmgSJ/X2YudHWu0GNCGc7GXKDG174hLJ7Uc
         fFLnISc8jCENBzzwUEiIbNYMfwnfV3rQwO5ewPXQ3FYRhNwQ9H86zj1LRCy+P6fRJoAV
         SJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334887; x=1794939687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=DTTJ0fQlqadzWolA7eeRUkm3HDXKPfX7qAdjCty9PStDKJULB3Cghmx6ro4ggFBnFJ
         HJMDCsCJltSobhB+eNC1Fw7hl/gdQ4OQMknEUwI+pZEXjPbwIHO45WSbu0kV41Mq8rOz
         CdI3B8r8gGJZus3+b7gR00fCuN6rUnXKcXvoULuGmWARGg1bP2M5HH8tmtLiRCudj5SL
         Ai/MVwcNQe+Hqx8mh2fTIdAos5mmsXU6H6gUu2QqnZDTFSxaXtMHTXK6g/cIBLNpKRTQ
         2cDJH9cViBUcL4Mw4+Cs31pl5Bza695WxM6vatyCL2wlLUF1ErWJBrbPUmfAZv8JYJ5o
         rEDw==
X-Forwarded-Encrypted: i=1; AL+hErG9EqbF+pAsVYMRKrqd8i6o0ZlsUUJyFsHuvj2XBx4KY5inWYcp5AOO//nm7USU9q1goTd/aTH8+xXoyNPFvOLI@lists.infradead.org
X-Gm-Message-State: APuU4Z/eSIqLaHMTGMRUVfLukUiQMq13aMp8SENSsMeWShD3CyqiG4ot
	tHmTG2ipXovycDGRCMVluG4JxK345Si57zjrLqs0TiS3AVZcGj6fNfuP
X-Gm-Gg: AYBFou3x31cvNyK+KgA9KGNRURELTvj/ohC/HyUzLk1WIiSx2islPETfZ8vO7gsyJHK
	GXNSd0/+s56ESd6Il7Vo+O7pBLifAntiBGXj7eLuKj1GiyeUpt2iUpATE3dVtyN9xsNa0VwK+eq
	IEQ9FeGV0Ji/bhJZf1w6qagoikiVLUxMjFl7139tOjqznHOmJO5WfnBf15ZE4K6BAta/wtuLSjW
	0VCb7BkabZO/EV20nbawOC8isG/HgQDXMJ/58HwsQo1vEbFlprWeRklf9Km2KlEAEYEEKuU7Hix
	lbaGXJs477EbPNpDYN05shAFQyFB329/ZHzeVm067R+sOzI1D8IexvIKLePd99mkvY77W3nK/GG
	Pcj7Delbtf+MK25EmkRoylz11SFF0N84Q7Jd75FwiYt0jb/3a2LiWtmuMxiVuBp7HJ9e0rOmu82
	dEeTdd0PoBmNsltqXxdE951Mag3//5eUbitDnfVB1+9ocRdjRzHuPdh6qNOZ5yfbYX7rYfqskjK
	kr5j6ejNYU3h9A2kYChzSf/Nrhfxlkn6VEqAoXQNxCRXi0PpU1t0uQz5jByH17N/jxVSjowxrwc
	dIudIPWPuwavR8BHHo6YWVnfRz/eSmaSoPEoFmIjOMxrPAhsQAA7KZtvEnAB0UTml0k81uABLyH
	Xofz5S/gYnSDLie7YCRXBMh3bue8bgqyLu+iT0eDre2n4d2Q3FUAVQOI=
X-Received: by 2002:a05:600c:8b84:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ba02355aa5mr62875845e9.30.1794334886677;
        Tue, 10 Nov 2026 10:21:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:25 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Tue, 10 Nov 2026 19:18:10 +0100
Message-ID: <cover.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_102129_595965_0B92A20C 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 647 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1294 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3


