Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED70606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xtaPxChA;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WfaGMbHP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=; b=xtaPxChAVrcAcJZz9aVNy33M26
	lK7lP+1BXLCRwcGRTCRfBfXybFYvZKLajpU6gg+sJLX0ChAXL0i1zwG6soSBDLsN4PaAhahjMjl3w
	h1xtBXcgW2uXG0YcgwpwxVISgBW0+yuYkfxmoLphxhzgqwmQJi9+4SiIl71aECj1hh/xJGj+AOs9e
	1ccd3tt2u74EfG1MmR5R/rztCSNY15YteTTBjJWFIPKkH3yMeFdN+dJ3WSSxxfV3fJOoPI2kkrg4d
	IlslyQbGbKwOzuJQRFkP43QWg30NGLkSx9HS0EJxOAP+Y2nZlxRMAnLlytQ3BwdkzwJbs0R+MweC3
	fEysA6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uV-00000001Iix-0ouc;
	Sun, 22 Nov 2026 15:55:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uT-00000001IiA-0Sef
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:55:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so20991645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362919; x=1795967719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=;
        b=WfaGMbHP6gGe6Y8vEDilRlwunfSvUxdCZMosf15yVGArjh2kWVhWr6frMmxer/0PG4
         qiIH/i6hutdLDQurToKA4NP/rqY6vxJzqxl3HO8rFnZ5TUoa3PPM8aYT9/ZSDs99lLRF
         vboellTWgPYeb44VPJ8SVkB8dibWv66/ygXnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362919; x=1795967719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brpic2gxGr+UpSfI0BgDue8RQ+H82jnfKcpc5s/aMXc=;
        b=03jHIj67Hxm3kpJPwDr8txe1Gy4MvjEbW2TefEqTdJRT8PxYBw0uui7nqmAW8lP0tT
         xyyoanzUr+gGc9zp3usn9yZzjsrATGjfRl6ykRJO7Ky+futfOC4aUvP1DCtM0t+5N3pa
         PyMpnbESqf/7RF9J/qK58XrwKFMiwyFQwPpxFG1suN8dCALrj8KMfqH09BFr3XLH8a0C
         ImR6AdcKIFHAmDkjnVMgzF86R2eUJv2lgnUpJ8tBcAoRvCJVq6yc1l2Du0OZSCrheCs3
         ynvqFUGsVBM1z6tOcQpF1rraeOi9bRpdqMiI48P3wN8EpywfCKrbaMFIZ9C+R6/0dtCu
         M/2g==
X-Forwarded-Encrypted: i=1; AL+hErHbrG8iO9vG9DG7QKfPjtA30yJWJ+yhxMus0Jdu0XlyUumUCGTAxNeIWjgOOh9VCKnniN/GibVcIuYiYQJ0Dqsh@lists.infradead.org
X-Gm-Message-State: APuU4Z90BGqtFeL/wMygKgcHIRZT/Ua0r7cnCjvR/gWkFuaMyPUV/8ap
	EOAiftRZ+q8OM/G9Osqb0GqCWve3sNbt+YxAm+chstDRFaou5YIg50tTdbIE2ph9TsY=
X-Gm-Gg: AZFdTZfnecHUuWXiNnlElkSXWKhhg11d66ZvlAq7nBRhfbiBKQHYNBp2AVsMiGwm0oB
	vamRsmrjseHKUAVLyFjl8wAzMMqKPvoY1ehQCpqh/mhHrL+6OXTWBEXDZzXnDRn+ONaHa8upR3A
	UX6AxI9inPeius++AW1+J6HuNtAEPq7yZhBb9jy/sV+3emmyxLJ07n0ZYR4MVbDGWeOKQeoBloD
	oPTgDrN0LV42F0SVtsrCB+gQOu67pJtSPG2Z3AczGAZT2tmDR0UDR3BMgAVI0/HuFCMyoUBMTIp
	H2SlwWdX4LC4OsQMrWhs3+NA6WNSjlgI2TVFRqwlBrzQ3FOIZT8Yt3pGHuruLpMU7+EVUFNCjI0
	ixzq1HNTm8DDsGrcggn1dzx77d0TrUDQuLxINvMKJFBInmJGkZZYU2jHw0kP00V54XPYNZUY2QY
	vOaekBT73QE7dy4LZFex/RTo+a2zu9RFuRjd0bgxK02vBBIldpw5DORf00XLDMH+lLkz90nguVh
	jF3gVgNa4ChxxOkz5oNC/u2zaePS6XQaNY00kof0S6dLfz9szPNPK4jQOfviemyZOZ0dSBM91sa
	6/fmSrG7QN0LTjY3b9vfP590Hc85vDDock+6tFshNg/0DJUcEuYue9PN+dJrR+85GWa76mEuXwN
	kBArliNrLms1Ksh7VoS5aZbXSnX9psnMXIRpCaxjJOvq4shfkGuQJuxNbrScgMa+o17aeYAWeeQ
	5VkK/uIGgGg0OhWrpcdB9lmqQZDA==
X-Received: by 2002:a05:600c:820c:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb887c281dmr172330355e9.1.1795362919237;
        Sun, 22 Nov 2026 07:55:19 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:07 +0100
Message-ID: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075521_172270_FB1DECB4 
X-CRM114-Status: GOOD (  14.86  )
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

The first patch fixes an error path of the blk-ctrl probe. The clocks
held by the last patch are released at sync_state, so they stay on
until all the consumers of the blk-ctrl have probed.

Tested on i.MX8MN (BSH SMM S2 PRO).

Changes in v3:
- Add Reported-by and Closes tags
- Drop the runtime PM reference synchronously in the probe error path
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- New patch
- Release the resources of the domains left on when the driver is
  removed
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed
- Rebase on the changes of the previous patch

Dario Binacchi (4):
  pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  77 +++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 144 +++++++++++++++++++++++++-
 2 files changed, 217 insertions(+), 4 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v3

-- 
2.43.0


