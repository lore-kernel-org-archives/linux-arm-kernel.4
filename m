Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A29606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MK+PacR/;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mEicmolL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=; b=MK+PacR/hIiHkUT1Fv3j3dPD0t
	M5ZkoIFJKYznp7tXUwrU6iPeetaSeltBx+aDTjF8Hy66KnVvyFPAVF1YJgwxMmhs9rWrJw+lrjJ3H
	siGXVmmc83vNFt/Qk3oaHDUnINlWP5OnY23rvVblMcHCccWWAdJ5QGXsT5MbOYDz6K10Ym5jYUd++
	TBGiuO2O7Y5rNEnEOnED0PwK/NVBhRraS/V1RI9VwoJT2sZEVtF74BTKh4KCp5y9wLr68wqMLtr7u
	n6ipzPxkjsDHZsdc/Z++BcbWh00q0+HhiAGK/YoIScrIi9g7AcDqOXq0eRKF7Nde8NHZw3GweFhXi
	ZyPi2ROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknP-0000000HEo6-3BYE;
	Sat, 21 Nov 2026 13:06:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknN-0000000HEmq-1sDr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:06:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so17884425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 05:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266379; x=1795871179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=;
        b=mEicmolLnV+PtqBLMuHaLWQzj9UFhU3xK9kabjPqUcdTc4jCMCQdGyy5H9tQfR16fp
         QhRviGXgxHY/UfKEyroerTOs2pQyjkDJnqKiO4WQlI/EdIpxIH67GbmdISnadD90OSiw
         APIrFxuOLwXXP9AxJ0Gu6beMSeMbfws/E9Fc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266379; x=1795871179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=;
        b=ukOO7aT47pItg6bq79fAkICtuK7uTIKoEHiyhkZGBHJqZqYe+ukqt+XktIDZjXkYoz
         5nCMKUU2XTmQH96lL+AUjCnCP2TzyKviZ12bZAy7yQ4Z3lWTDWXlFmyzjBwOjUS4mN6r
         PmbGwAubn9crcMH38g2oMQGP3goJKHrO/OiegcmD4fNu8z9VJPJ21XkOMMFUO7uhPH7C
         4Si3qIxyKvyeBjBYnG+aiPELxw9uwqSgk5hjicodwz2XF6V1PJgXg0S0a3VJOuC/Wjar
         BMHDWeANnvI6VThZOSvDdcGffrndxzm9+mhNsoiuk3MP85SIftrrKETFpFIGNNZauMX8
         mUkQ==
X-Forwarded-Encrypted: i=1; AL+hErFHMHWmU4WNppyGuEtGaopXVbm8TJ8zko+gh+1SDg0Vfu+Qx5BzWWVZVDrr9sCUgc761FmOo9EydFEgcf9KjGm4@lists.infradead.org
X-Gm-Message-State: APuU4Z8AcuL0w7r9n66GmKxhAowz0UM87yn6xRijgDw18wdw3Rfx+gB4
	pRNwDb7p990/ePuk76mu2ziomWxxd2PA1BOLGtcouXz+xUV++egrBXNKAQF5TNgaXJw=
X-Gm-Gg: AZFdTZciRdVu78IkyxJkn4m3qD0/l4EgMMB20ovFGWO1salwUtehVJvPtC0lP82so3/
	yLs/G/ZZmdJ+K589X6qvriQjxNCj0mwlSiuDr9EjcMxwp+L4jSjTww16rnBYMU72m7vW2SiGTlZ
	7S/smnlosrl1CRyTfAId1VOkNwkAx80VHZFZoq0NTewO/FydzISKbqh4GmRoseMxDLukEk8as6L
	2R+Hmxxqbt53zK5NIMbZGyiCg8kLWcOMujNmJ9wjYdnLoqyAGKBckHrcS+h/18gzRGN/60BQGaM
	FtvUThYvr4y73UHm99VcZz7fPtfmEYxTlUhm4QMk8WeXVNNxWuUHo/f/wLHYd4GPn0jeRM0uMLX
	nZl1Jctt5y2BrHKchLG3aCjlyNpZAEqFJqJL++uWE4ANV9hqkb5HOlaq/+meTJTrqFSzwhXJC2Q
	SpAVh3znNz5CSt8uaGSQ1hPTS2gSyMeBAZZPg5+nUxJRadMC1hZA/toV6zgKJ26SZJCPwi5Dj+S
	cfNQFrqFNAQ+z9mK600kPa6rPVTIeXTlqWWZqqpbEM38QqH0haEtMOZEfWM0wWDiOjrxMwwsT2J
	2R4MDJ3uhMaCNmztd5MVTtKOYXWZGrvmefVznuKuyOgg7IwNz6p6pYRpTVi91VgVQJ+zUDlzyWm
	LkhNo1kTZ/qj8qPiGRG96utyOA3UgP/r3zEJm7S6LwD3ifTQRqZxeaXtqRenJfTr+OaQFWNyrbo
	1nE5eoRdiDxqqs5opmq53YNDcyuQFbiJHmg0fZDEE1YGzE3Vo=
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr139372685e9.5.1795266379055;
        Sat, 21 Nov 2026 05:06:19 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/3] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:07 +0100
Message-ID: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050621_521646_186751F8 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX8M power domain drivers register all their domains as off.
A domain left on by the bootloader, e.g. to show a splash screen, is
then powered up again by its first consumer, which on the i.MX8MN
turns the display off and hangs the system.

This series reads the state of the domains from the hardware, so that
the ones left on are kept on until their consumers have probed.

Tested on i.MX8MN (BSH SMM S2 PRO) and i.MX8MP (Engicam i.Core MX8M
Plus Fast Ethernet C.TOUCH 2.0).


Dario Binacchi (3):
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  61 +++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 115 +++++++++++++++++++++++++-
 2 files changed, 173 insertions(+), 3 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on

-- 
2.43.0


