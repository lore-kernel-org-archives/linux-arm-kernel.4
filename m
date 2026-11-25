Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+HCalp2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Cu6EkesjJ7FuSk5yjt5PFisQjtujNk4uVoJgpnmQ3Pg=; b=u+HCalp2MuFhsXFlJlPX3+QqeJ
	PfXwvOpVjhHy5RUrCFRyMsEH03TQJ1iJQSZ7RBfOAm6s43PJLI2ULEebDT9sFfp+An+BSHaZEUF7Y
	RRhZM5hfy/8D1T69CWmAlAbZmF7TyiQZ5zCcTju5YNBzT7m53FBnZKXwmWnBAXgNaUtZOLt6s+2ZR
	3sZirTtgJ4TZ9ffGkY2c8hONkM7EmyMPHxrZyrB8ojW+aHz7Ug41tIkXKNarFg3TMh6mmeDRJGNag
	BO3WCtPyRWXAu6UDGjiJOdkGFjlSw9Pr1SF2SA+yj/Po27/9QMp9VkYqgTTlyROyCili1Uos9p9nv
	45QXsslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBQ4-00000009gGV-1c3K;
	Wed, 25 Nov 2026 11:44:12 +0000
Received: from exchange.fintech.ru ([195.54.195.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBPz-00000009gA2-32AX;
	Wed, 25 Nov 2026 11:44:11 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:33 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:33 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang
	<hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Alexandre Marquet <tb@a-marquet.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 0/3] drm: analogix_dp: Handle runtime resume failures
Date: Wed, 25 Nov 2026 14:43:12 +0300
Message-ID: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034407_771776_877CE8A7 
X-CRM114-Status: GOOD (  11.11  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses the unchecked return from phy_power_on() in
analogix_dp_resume(). The driver currently continues controller
initialization and reports a successful resume even if PHY power-on
fails. Patch 3 checks platform power-on and PHY setup errors and returns
them after unwinding the resources acquired by the resume attempt.

Propagating these errors safely requires two preparatory fixes. The
bridge setup and AUX paths currently ignore runtime-resume failures and
may still access hardware after a failed resume. Patch 1 checks resume
in those paths and avoids retaining a PM usage reference when it fails.

On Rockchip, the platform power_on() callback leaves pclk enabled if
setting eDP mode fails. Patch 2 fixes this partial rollback, allowing
patch 3 to return a platform power-on error without invoking power_off()
after an unsuccessful power_on().

Patch 3 depends on patches 1 and 2 and on the Exynos pipe-clock conversion
posted by Alexandre Marquet [1] (used in the development of this series),
or Marek Szyprowski's alternative [2]. Both move the pipe clock to
encoder enable/disable and remove the platform power callbacks.
Neither Exynos patch is included in this three-patch series; only one
of the two alternatives is required.

Important note on pending work: patch 1 overlaps with the pending
analog-init cleanups [3][4] and may require include-block adjustments when
combined with [5][6]. The bridge-detect PM fix [7] is complementary to
this series. Also, patch 3 is built on Pengpeng Hou's earlier
proposal [8] and addresses the platform power-on and
unbalanced-clock-cleanup concern raised in its review [9].

AI assistance: Codex was used to analyse the error paths, help draft the
changes and commit messages, and prepare this cover letter.

[1] https://lore.kernel.org/all/20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr/
[2] https://lore.kernel.org/all/20261119223843.3694307-1-m.szyprowski@samsung.com/
[3] https://lore.kernel.org/all/20261120083302.3719465-1-m.szyprowski@samsung.com/
[4] https://lore.kernel.org/all/20261111094845.1673-1-laixiangwu@cmss.chinamobile.com/
[5] https://lore.kernel.org/all/20261113082305.541652-1-damon.ding@rock-chips.com/
[6] https://lore.kernel.org/all/20261111164243.77775-2-blum@kernel.org/
[7] https://lore.kernel.org/all/20261119103742.1161858-1-m.szyprowski@samsung.com/
[8] https://lore.kernel.org/all/20260828091334.5793-1-pengpeng@iscas.ac.cn/
[9] https://lore.kernel.org/all/20260828092624.9054B1F000E9@smtp.kernel.org/

Nikita Zhandarovich (3):
  drm/bridge: analogix_dp: Check runtime resume before accessing
    hardware
  drm/rockchip: analogix_dp: Disable pclk if setting eDP mode fails
  drm/bridge: analogix_dp: Propagate errors from runtime resume

 .../drm/bridge/analogix/analogix_dp_core.c    | 36 +++++++++++++++----
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++-
 2 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.43.0


