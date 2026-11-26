Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F4606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cYpIzR/o;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBLTnZWB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=; b=cYpIzR/o845xwptrcls4876zD1
	3nvfetP+eFECKYWppFBboXOiT+n/zw6PBWUpCrH8ODedD+beuPadoCkcmp8oCJB3atubufA4zVjVa
	4qTxED5/YeR/XbJ2gbyb/eGm0agIFr71H2oMSjVsn5U+b9gxLCFKpyFTDKJ0Rh5g1y9pe+guhQuT3
	+QqQcrMQshTyRDHVrZz8LgRrADLLIyLrLLjcAgt0Z0Ge/QGGCBeRpcihPhsijTbj5whfzXe0WOIkK
	UtBP9GP074E2xrcugVD7e+9OJicy7S352yNUd3g22+uOHaik1VzC5nzs/OC8uzdNk2TFbkNDvw8GN
	zhXO8pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcX9-0000000DwgQ-0gkP;
	Thu, 26 Nov 2026 16:41:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcX4-0000000Dwds-2ULB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:41:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4868749f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711272; x=1796316072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=cBLTnZWB7bVi8H31iR7l8Mqpn1KIKTQqUfnuYtv72aZ9ukbTNuxIhipX7ZICrjHLQT
         gZ3mWjYpn7W0H6BscGhlGQXEkqinrreSsS/hril/RzaXwOavZ6Ztsjy3m5sZyj64dSsB
         +kmQogQnhdRPyYIvGwu682dNbOYiuojlsIJ2MPebcdRrTTepbF0octsl0cl/FDCWrJuR
         gyuraabc6fnUaQtbfVIzGjW9nzWnCHBai5eVLN+dFkizmqEzHsWhjdBqa+m3+7xrI8+C
         kSci5EJNCjluXlGmb0BWJ8Fg17DkE24GxTKtHAR60VIlspsq/PflsYuMolLQiQeF7LFD
         BepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711272; x=1796316072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=xSFK3KeFbKR7Dxiua/Lv0Kkdf2UoWBVsXe1HNZ2HAyU56DusHjaNXOlKm0P9nj3uTP
         NDWn7/cFUlxhf+1FDJn/Nvw9yM8WWBWoLd0oVJsnIJOlVLaesenue5+xLIHAmDZ6B1ai
         2s1IqewAX+uLCo40iPpiT1nrvZT6gioaBkOvYHdSTjZX0nEeSB5i84PiDHsk95sP2Wgy
         MFsCCc3gyumLXu8UUDjdptvCaGqadEGefqB5xCd5D88qg1hDYy7e5T6A8WfJMtfVihCs
         pF6vLoKPVwt9n6LvR6pZma0PbqpTBvq59o4ynYTj72v48CKhCZjNWUoJVLWwkNMdmP9f
         dm+g==
X-Forwarded-Encrypted: i=1; AL+hErEih9lRH39ldmYZHFfa/onoXyLEZCiuVXTL2u85Qm483WG8YRDe3wpe4Luv4n9RMN0iKNdFb4hZZgOUcJnIwwla@lists.infradead.org
X-Gm-Message-State: APuU4Z94A6YWvD3FT0bv2u7iFg2+wNV/IRoG5ZRRP/bUsJBrJbJnrkMN
	bw8STxTSCigpiCsHG7K3iNAqU0AWzjDRI4knhlfeqyzIlLfZpeGU6VGR
X-Gm-Gg: AZFdTZciGO7AFZM/84g5m0YsUmgt0LpY+dNUcyvzjNPHW9nht/7296speWeNQq5iBkr
	8K6DByCZgTRwo59Ro4ypvi1xzekPUQ83g3rkt1qJ0JrIHoO8qVwWXbRIAqJGVIr0+JsCzkX3SWF
	SntJ+qQv7VwIlBjhv2TTs199rbVAQbUFTK/T0agzYi73lI3z54unMs/xIOg4J/zWYtsPCwxw325
	smLTmmbiFLTlQoWq+T51wjTq1AM01c/OxtzDOUyrjlojqgypR8FEUYrSgdZijyI8LaO3eHJuYRn
	T/W2MJyFXq+L2ELY5nkN476cCx2kfO2bJsRBhuHRSZRg6x1YVxyDOzyg74v12G6g6d1xA7GKNkB
	Ce7uado/yiJ0H45f/WQ26wN/Fk6qYfpfkam4un8fHo6Oyu6IlcI4Ea9tPx+PIOj9QoyQgI8UnX7
	zOqjUxgASDIrVTTiHMSjk++TNn77dL9SjyCK4x9TBztiBa+ZBspUrLwXK6P+DYxA4n61DqkX40O
	l6ZKB6UkxUwZFLDRGt6QQUJfjFrKQA3M/eeuMoxfCLGmBYMA91saU+zuHDIeFOZZVA66dFJ96Yz
	/f9W+P8V3zWtHvBxFKtbuWQ7v86rpS8SFOeEFBH/xBB7giwuPveuYZY=
X-Received: by 2002:a05:6000:40e0:b0:4b8:5ccc:eed7 with SMTP id ffacd0b85a97d-4b85cccefccmr15497144f8f.51.1795711271385;
        Thu, 26 Nov 2026 08:41:11 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:10 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>
Subject: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the blk-ctrl virtual devices
Date: Thu, 26 Nov 2026 16:40:57 +0000
Message-ID: <20261126164058.2373605-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084114_658839_FF06DE4C 
X-CRM114-Status: GOOD (  15.26  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The i.MX8M blk-ctrl drivers drive the GPC domains through the virtual
devices from dev_pm_domain_attach_by_name(). These devices have no
parent and no device link, so their position in dpm_list relative to the
blk-ctrl consumers depends on probe order. When a consumer ends up
before them, the system hangs in the noirq phase.

Patch 1 fixes imx8m-blk-ctrl. It is v1 [2], now also linking the bus
domain virtual device:

- i.MX8MM, VPU: the codecs resume before the virtual devices and the CPU
  hangs in genpd_resume_noirq() of 38310000.video-codec. On Verdin
  iMX8MM this happens on the first suspend to mem.

- i.MX8MP, media: reported by Advait [1], the CPU hangs in
  genpd_resume_noirq() of 32e40000.csi. His debug prints in
  imx8m_blk_ctrl_power_on() show the stall at the first BLK_SFT_RSTN
  read, after pm_runtime_get_sync() on the bus device returned 1.

- i.MX8MP, VPU: a normal boot works only because the Hantro codecs defer
  their probe until the blk-ctrl is bound (the blk-ctrl waits for the
  imx8mp interconnect module), and the deferred retry moves them to the
  end of dpm_list. Loading hantro-vpu after the blk-ctrl has probed
  reproduces the hang on resume.

Patch 2 does the same for imx8mp-blk-ctrl (HSIO and HDMI) and is new in
v2:

- i.MX8MP, HSIO: loading phy-fsl-imx8m-pcie after the blk-ctrl has
  probed puts the PCIe PHY before the virtual devices. On suspend the
  HSIO bus domain is powered off first, and genpd_suspend_noirq() of
  32f00000.pcie-phy never returns. With the module loaded at boot, the
  PHY defers, ends up after the virtual devices, and suspend works.

On Ulf's question in v1 [3]: the GPC domains cannot be genpd parents of
the blk-ctrl domains, because their power-up is interleaved with the
blk-ctrl reset and clocks (see 25e252bcf159), so the blk-ctrl drives
them with runtime PM on the virtual devices. The consumer drivers only
see the blk-ctrl domains. Runtime PM is disabled in the noirq phase, so
->suspend() keeps the virtual devices runtime active, and the runtime PM
calls of the blk-ctrl do not fail in the noirq phase, while the genpd
core powers the GPC domains off and on through the virtual devices. That
requires the virtual devices to be suspended after and resumed before
the consumers, which is what this series adds.

Lucas pointed to v1 as the correct fix in the original report [4].

Tested on top of ulfh/linux-pm fixes:
- Verdin iMX8MM: 20/20 suspend-to-mem cycles. Without the series, the
  first suspend hangs and the watchdog resets the board.
- Verdin iMX8MP, hantro-vpu and phy-fsl-imx8m-pcie loaded after boot:
  20/20 cycles. Without the series, the board hangs.

[1] https://lore.kernel.org/all/CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com/
[2] https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
[3] https://lore.kernel.org/all/CAPDyKFr9Vzgm2C6Z57Bg5mUQxg5LK6goN2og3+RC3BkTZjiqJw@mail.gmail.com/
[4] https://lore.kernel.org/all/8636fb8d9809aaafbd8274ec0dbfc250e1113c73.camel@pengutronix.de/

Vitor Soares (2):
  pmdomain: imx8m-blk-ctrl: fix suspend/resume order
  pmdomain: imx8mp-blk-ctrl: fix suspend/resume order

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 29 ++++++++++++++++++++++++--
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 4 deletions(-)


base-commit: 458777762756acfc7d2c20067cca6cc817cc8dec
-- 
2.53.0


