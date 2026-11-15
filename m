Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XFO5arDR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm5I51Hh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cuIPeSmMQumt6Xz/JP9UG4bk+SAVXVlRFXLYgQ+8MVY=; b=XFO5arDRzSiy3w
	xRhGIVeHdmE89qlNArEueUw5TEAiVEQYtun+5cJWnjm4Wc/QlYWOVtFm/R2Z7lT3bZnFd61mKpisu
	NUtgQcIw2d8NWuakOmmvWRr8M1Zs8eLqjy2TFDClVfO9MLRnP+JqivtLJgXguS8YVG3fKAxRmffw8
	sii3LShoI6n4uv0FaSpodC4uDP1MYCpr1ZgVQp5Q6Yq95F0/xlJPNJdsj5DQagI/FX6ZDMJexnGt7
	LpsRJ/faTkSjkAxob+wrJIZFvG0oltd5YC85VnAoTSiuedL07oEm5NHEcGCAQgXkugrQwSGiu4hB9
	CZF3orv5tmaS7Fvted6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSblY-000000006Pk-1KpH;
	Sun, 15 Nov 2026 15:03:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSblW-000000006Pd-43Xj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:03:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 652C740175;
	Sun, 15 Nov 2026 15:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821021F000C4;
	Sun, 15 Nov 2026 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755014;
	bh=cuIPeSmMQumt6Xz/JP9UG4bk+SAVXVlRFXLYgQ+8MVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hm5I51HhmteSNslariNAGq3luQb33RBBUVD8h6cTRV733B9WRFMMxIfAZh95Y34AP
	 omVgGGvPDO+j2+glRsgfzVhl+HsD0unPwDT8n8qnQzc1oVLmucPm9lyLWBXH6UHkBg
	 fTxZY0J8INyk4qujuHLbma3GE0cH/QnFvu1IOj+dwF1sact5wTZvlKpKV/J3Xf0YVq
	 Od66PSwJRQaQLArlPZ8rHNvivVRmFQk6TfwgYYp/iDFJG9X23oPMOy9Z9PzrWMzzN+
	 HYC5mmsdmxoJyyOzxgBG4iUrztSgUAGiRIy3f82glCCfYl6932ep8nT9d78z8HuWaF
	 Ug/ashFhhiJ8Q==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185659.884455-1-jernej.skrabec@gmail.com>
References: <20261104185659.884455-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
Message-Id: <179475501230.3244977.13845276937669658695.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:03:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 19:56:59 +0100, Jernej Skrabec wrote:
> sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
> reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
> undo that, so the clocks stay enabled and every further bind attempt
> enables them once more.
> 
> Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
      commit: 39e407b553ec15d4a233b651531ad431ed7542be

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


