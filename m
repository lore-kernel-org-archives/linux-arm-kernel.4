Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZNg78gKZ;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=eoy9sL2d;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oOvdVOD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tfj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=; b=ZNg78gKZOCYdUG
	0N4ccjVOwS+Thv83tD3WwqgIGVdPeHqxwhoN42SsY4atiH5f4zBNMsBRMFcrXCU6vm2DugQbUiOJC
	JH7QjSmkk6UJj1dKcKGH1wKshSsx54jo5UjSzzzf6m+p5XK0phth0vhACGHWNYsjBdMmcVJPOYKqg
	cMkeJYxjamY3vwSWKFqVMGS+hFd0l0952FsBK3FSP6oG8mZseT4j6fI+5iRezI4dBEuoR00N/9/OG
	BoVH8JymuxKHN/Prfln1inb4evjkDwgSBHvHdgVHNJXhYv4E50lKyzDGooHHSkgQVH8kfWZO0HE7/
	zOo3z9eUP9OIYWPfOFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS450-0000000F9OZ-31oX;
	Sat, 14 Nov 2026 03:05:26 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS44x-0000000F9Jr-1ovU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:05:24 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 91EB01381A1F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:05:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Nov 2026 22:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625522; x=
	1794632722; bh=Tfj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=; b=e
	oy9sL2dNLnO989HGOCiTzuBakV9f2tNPrhAZwZ2S/H7T1y3YoQN6Afbj4b/PD5Yk
	78B4kziy3CrxneEjwXKzuJVNfG1dKtWcXtON1eiaqxIrIR4KNqSDtEIvFpNgvUa/
	rozBmsCPhvXAAu1ooAL06CiB1GWb5MXTS2TG/WWmCWg6CQ9vT92Zrk/TDn/RowFo
	66SVm8bXKCva3kCN744I/ajzfYwfuV62K/wNpSo+bG410BLlj4mDasTpEox6Klwo
	hyrLjKqMgpZhvW4MrXbmHIOE4yzvMVyS5UKwh8biCk3Dtj+xu5SkHwJn26RYDkqg
	WR1hpk4Pd1gjUGjaG2tNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625522; x=1794632722; bh=T
	fj8xOhGv3aLFSnyPnoftSykJdx3O2+yOv2fTajXqZA=; b=oOvdVOD7CwnkY9WwA
	7rxT5XeRzIMClXy4KE/DqKeXDpgXoAM4ZLUwVMD+BfkXdBioHfEB5xgadNv5/F23
	TEihit6+d7CtfBSfGuHHUsusulYNvSQRrsnauTdUSqz9vM7j3Vw0HFx858sJeTj6
	i5kfn/a6VC8dYcMdImy441Qq3dc4p2DMocwR7pQu1lyRy+Qs2TPmZ6u2AHfOjMau
	3Fn31p1skqZrqyCos7qoea+SS3ISr/MDgpyGxl3YlTER21KaJ0XScMsEINEqPLM+
	TIE8OJqQryFsLHmoJeZys72ytbJlZkj81o728TOQSCmktoLUPfw3An7QDW3wvHbO
	ICEqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625522; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:QxJg6mlxQmsTdO7cuys59yVNfS2vUmm89lMZ10UDfNKqqDm
	nyzZwCRWSZ4aAQnKcPj6pdU67UHGPJRKy/snd0gchNJ8BtuNpXSBflkOKoKQc0N2
	VouXAIHVZ2tg0Dx6lSMQIJ94k94UvUsGxiHq/aFHJHsHQbbail2Im4yExOqdSqM4
	VnJ+mnFFIbMfW3BfGT0msgnDhShw5gLnxNlvSNqJ4u+7sTj91AnifRdTll/2/LxC
	Q2WBjkDGZ1FyRbwM0tA+qy4pOtf6ALEH57usRCAYMsuoyceE+HgEm/HtYYhVTP1s
	0O8WpOvcgmtLJPVz98f3UAtxyxpNvtOMGFWi81A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6y5iaDAnBfXRiHNj58VVFezAuAMpgT6TSdokhg0cty8=:WEBOazfurM23ahZUC/wEzSpnZMIbPO0jswk81G9oTOc=;
X-ME-Sender: <xms:8s_3amdoVRQbxwXN_Gd6nvVD9-8I9V3A973jhT71BgEyJG5-ddcLeg>
    <xme:8s_3alxd0aiBarRgzIwmHxlL715zydnTNeH9LmJhkUz0xWwqap7h60SJm2g4qV9js
    lU9agDUvArCx-GUK89mPyrL5-iHUDLMTRda5-3ksoB7R5rdGIUcQHI_>
X-ME-Received: <xmr:8s_3ahHwJujI5wWyuICQY8mXighRJBzFvOJTbhyozCyY0Xqi_1kagtl-9bpjONxQfzfaiZpQ>
X-ME-Proxy-Cause: dmFkZTGz9WnlZjVE2HKbL42hlhRiRjvh0qv13kuFDFn3+2l+J9l5ZGi0ACkeAsLfSd3Pvm
    YnlMS6eJMEMf4L9dY8Hb9ude5fnVrJbsKsxhfaxf36lbesjLo+5+GoIQX4PcdWwScCLOQJ
    g7fRWRTDzKadWbOl0JgzaeqbKfjBdnDAiS60usPLXDekIwUGuNacgS3BUb2Z6DoRzwPsim
    aXV56gHbLmXbQ8zGVKzUj3foq+ONearsy4Enm9lW+YRz5j5Zg70Pr5jnwTPLaiZWa86bGT
    V4eCQsfBmuolPiuUgKaNhZYhTw4UbN7IikU43gT975Fdei2j3eG8+tejGM6+krkKFdM1s6
    WhSY9EIJP/hePWkGhuzp+ZcFrh0AxEQv1YcyeoSH+pe0ZU2IFnuBbTDYc1WlCSZ7b9LlP+
    tyrj85U0arqfBhuTjuZtSLSXcpOc4LQFxRUs12z9ClrIfNtmu3FcNtFpFbQRS4nECeNnrC
    V9DeOiKvDvx/7W4gMOzz/nnnSlxGuRYblsyKiokw+HqXNBe6SAMsMUck6ogJvfdxG6UsI7
    y06X2y8oDDPZj5m/1O1KNVwM89xf4SQYurNWifvt6YYolbB2oKXECHN4aNK6y4essp5leM
    Dz2EAkWNj/KLa0dmofrAOypwUSD4EgErsd8t/cqR/pri9UxZxPjXPgDFCv9A
X-ME-Proxy: <xmx:8s_3ak27dcHAq0rMNrVcmrNQDh54d7BIVbOtx5ORaZsa_KGVRL1jiw>
    <xmx:8s_3ap8JYAwCe6a_Xb69VTISvLGiYD_A7xzimnhgdn1NjdFVkISakw>
    <xmx:8s_3anE-gx_p2tr9MBB5z69Nej1smBIEBq03SnUww52PWaGvqBLxuA>
    <xmx:8s_3avhZJrNH2JikxaAUxpcz466Pj9TlfWsYO7MvML6SZSJaKqKhHA>
    <xmx:8s_3aomDm1h4R2RdDTk3NZhHv1xdhRL10XsYwA6hf83YbB4dun2mQLsg>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:18 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de
Cc: finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 2/3] pmdomain: rockchip: manage the RK3576 NPU domain supply
Date: Sat, 14 Nov 2026 16:05:00 +1300
Message-ID: <7a35b1c0ae3c4e130a156dbf477fa2df659ffc61.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_190523_582070_0743736D 
X-CRM114-Status: GOOD (  13.11  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rockchip_pd_regulator_enable() only reads domain-supply for a domain
marked need_regulator, and the RK3576 NPU power domain is not marked. A
board that sets domain-supply on pd_npu therefore still has to keep
vdd_npu_s0 always on.

Use DOMAIN_RK3576_R for PD_NPU, as for the GPU domain, so the NPU rail is
switched on and off with the domain. This needs the previous patch, or
boards that leave the NPU disabled hang when the unused rail is turned
off.

Tested on a Radxa ROCK 4D without regulator-always-on on vdd_npu_s0: the
rail is off while the NPU is idle and on while it runs.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 5cc2094e87cc..cb5487ed1e55 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -1360,7 +1360,7 @@ static const struct rockchip_domain_info rk3568_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3576_pm_domains[] = {
-	[RK3576_PD_NPU]		= DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       false),
+	[RK3576_PD_NPU]		= DOMAIN_RK3576_R("npu",  0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       false),
 	[RK3576_PD_NVM]		= DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
 	[RK3576_PD_SDGMAC]	= DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     false),
 	[RK3576_PD_AUDIO]	= DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  false),
-- 
2.43.0


