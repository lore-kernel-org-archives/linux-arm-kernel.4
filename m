Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqoA1f4w;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ar/jc+Up
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hep7RWQNpmLDtzTa8u9SOSCEbv6fAMG/njo1vSX4wa4=; b=PqoA1f4wkEmE34
	awUD/UK3CX/wzJUyblPbWgtFJywgpXs5lNvu1+Uyl3Y+Sk+FymW2Ez4xWAaaxfWVimcir9njeN1Pg
	7SrenqA4R522LJlhzshutOSCa6dzwV4+SGrOxdR/XSenakYwclg0snl8sm9vqd7fYfmQ0cJ0J12rB
	OGdyv6X7++e+wTJeQN5FXP2xxlFSUOwrhRcBMvIR9LuTRLxC1k1FoPCNy4tm8CMQcAzhtPCQDtiUA
	JUUhmlqm4mhvp6ztwvMfSrxEDkKiajfPcYRIyWhLXXxkfFD1Zs0i6n7mXjN7OunPaSo19zVuFjF1f
	VQouyuoZdJXHVq97WADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5ua-0000000FSAG-04lY;
	Sat, 14 Nov 2026 05:02:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5t0-0000000FQPv-2H6k;
	Sat, 14 Nov 2026 05:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632457;
	bh=45boCezNlmhhziUm1FzEEYt43rJYJ/1/7ikuYa1yghs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ar/jc+UpSFh0F7Z/zALXxHoNTyNx8NdTni49RhLmIZr6IJrWnFjKzgjbZdQZSnsXg
	 yHEMITid2W09sa29SIdOTPTzaQ2aTsmbHJ7V+7y0K8pVVBASzF8NiY7/2nxzBgV9O0
	 IlgsSDuROa5PWq4hTqqC7y39OX7fhvnztf8/eZOXZaPadqkEpuW3OXzThj38FTsS5F
	 ytlQkrmWxRk0xArdnkC2VgCS8AtUyO8vbQVlauV4wSOJ5d7x2aSGTvHouDHN0GXGGp
	 cV+cbE/2Fqe9Sui3KwfiNawhEbjrj6EPIRl2cRlGiq4lutjrIu7y+qoLvXfs0zRFxK
	 +4fnpw7lwjlAQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 058D817E3BF6;
	Sat, 14 Nov 2026 06:00:57 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23AB1480062; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:49 +0100
Subject: [PATCH v12 16/23] drm/rockchip: dw_dp: Add system PM support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-16-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=45boCezNlmhhziUm1FzEEYt43rJYJ/1/7ikuYa1yghs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36weEWcInHZA679Yj1StCqOFPYLhDNHZLM
 vbi3xG9n43o14kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaHF4P/jVBIVmlo/DZ5M7ZQqryNZoQ03JqP8zliw6mRVyQBiGyuwo+6lQRA7vd1nKW97Eretf
 n/CWVYj8b79IxBUwYe9gjAX66suftDI90MsHUNFwUCO7dYqh64a9RqwwczocasmQ+aK2kFh6bEf
 lw9SmBaMuF/0Y69SUKY5cW2ClZlAscf4YbAL9jGN+4iC6GL8FfZMYHNe664Rp3EYUBBQen0UntD
 3SkQwWHvpTreN0B/ahxMQN9HFmtTJ1j2vgLQAi2Tg2pB11/qPT8leRBenFbMRmO7szL7o5nNYjT
 w2Mf7LqteW4KHfihXAfA4/SeU8mQPalm+BGQ0IM+B+2YtSb60wOUgsUI1D4YSQ1qAexQ9RGoQzx
 umlqz+RJEkm9cLDfaR7YaHDoyi1hWTa0/t69L7eF/58wP/ceqrslxPLoiWb3ONZEAmY5re89SGy
 l4Uvi4IDcY6/mGP2DUKuHP+iesKqDw2zGYgGtvnfSz1mp9yx9TTGRsmuVNxCXQVbS/oEK5C8GBj
 zo+Fl6HdUBxytK1WnO10nvSRSWpZAf0vx/6bg940/LIsrBZTDYcg0HIc5uYBr75ufQjGHh39IGj
 feQntBTSgYCci+GVGIebCCG9N78y9SefKt+93ZQ3xl230Qt+xV5u/I/iuBBYMvTZHP4FVTpRy87
 i3GUbhbZAQt1BB3TpuE4tpQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210110_936219_AB75B841 
X-CRM114-Status: UNSURE (   9.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Explicitly suspend the DP controller when the system goes to sleep and
more importantly resume it properly after system sleep exit to recover
USB-C HPD register state, which is lost when the system goes to sleep.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 99d948a7c51f..4cfb40494379 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -269,6 +269,7 @@ static int dw_dp_rockchip_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops dw_dp_pm_ops = {
 	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {

-- 
2.53.0


