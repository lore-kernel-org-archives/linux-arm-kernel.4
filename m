Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF66606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rG4vk63n;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=HJh39rsn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pcu4Z0YBmWCircjybAGycW1Dhcl9eVo6UivDa5/Fmxg=; b=rG4vk63nLjfM/2
	pgVtANv9DJSarDOgo2Jh2WG+zopls/gYpeOVS1MF8LfByp8hOPXY2idY+5qy2VtU795zLPrpyXKQd
	AUYeOW0bibrJuNJIPvMLjnnySfGHGxTkFbAxdghI/Orh9Wl5DkNqFbD0eeLxhlfZ+X9ln9drbXsdi
	AeKQ6Q0R+50koTcJsWHpTtS+zIR1PHmSbBU708GGIttnKLXlFh/Wd403x2qZujUY54l+Gkil9uuYX
	jRyVga24xTBpS/42KwYujXBQaOZcxsERjfUZj7e5rJZDuW8vFrshg0nDvNMqg4AeitT2As/krVOBB
	gXyh7itN8A2AwAHPKVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUatv-0000000GhjB-0ncx;
	Sat, 21 Nov 2026 02:32:27 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUato-0000000Ghhs-3Ve4;
	Sat, 21 Nov 2026 02:32:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jWbnp3qhfzKn5m;
	Sat, 21 Nov 2026 03:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1795228334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcu4Z0YBmWCircjybAGycW1Dhcl9eVo6UivDa5/Fmxg=;
	b=HJh39rsn0pCQK2z2PO2POp6xK2+FKPT1CeP+YAoEidmXMinZJzJVxtECgbIGE3fDueqTfe
	Pmv48qfCNA3vGZJdDWbTVnPOqJPpvC0QHdf9QE/rNbayws92eKrn5730LcefjLK/qKJRdy
	PWFDqeTimrEw2LXHTAziBd4WL+z2DYX0mzaYj7QeJnGXBTbmNVWsj0er2O/yIYbh2vcCSp
	y14nWIAeBDChiMSlt5sLZBT5rU2NFsflD1enUul6zuEfygyJJFNde2GLPE59YEREOEyybb
	+z2/uFRqC0n2czfiepexptiFo8b+xMi9KvL+qeA2QyUPzFciJXbHFwA3H42ABQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Igor Paunovic <royalnet026@gmail.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/15] drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
Date: Sat, 21 Nov 2026 03:31:18 +0100
Message-ID: <20261121023139.3515640-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jWbnp3qhfzKn5m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_183221_351464_B49D9632 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -2.8 (--)
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

Hi Cristian,

On Thu, 05 Nov 2026 03:00:41 +0200, Cristian Ciocaltea wrote:
> @@ -953,6 +974,8 @@ static int vop2_enable(struct vop2 *vop2)
>
>  static void vop2_disable(struct vop2 *vop2)
>  {
> +	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
> +
>  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);

with this patch my RK3588 board (FriendlyElec
CM3588) hangs hard sometimes when the last CRTC is switched off. Without the series
or with the AXI reset in vop2_disable() removed it does not happen.

Here is a minimal reproducer, run as root, with a display on HDMI and fbcon on it:

  python3 - <<'EOF' &
  import fcntl, os, struct
  fd = os.open("/dev/dri/by-path/platform-display-subsystem-card", os.O_RDWR)
  try:
      fcntl.ioctl(fd, 0x641F)        # DRM_IOCTL_DROP_MASTER: leave KMS to fbcon
  except OSError:
      pass
  while True:
      b = bytearray(struct.pack("6IQ", 2160, 3840, 32, 0, 0, 0, 0))
      fcntl.ioctl(fd, 0xC02064B2, b)                         # DRM_IOCTL_MODE_CREATE_DUMB
      handle = struct.unpack("6IQ", b)[4]
      fcntl.ioctl(fd, 0xC00464B4, struct.pack("I", handle))  # DRM_IOCTL_MODE_DESTROY_DUMB
  EOF
  while :; do
  	echo 4 > /sys/class/graphics/fb0/blank; sleep 0.3
  	echo 0 > /sys/class/graphics/fb0/blank; sleep 0.7
  done

This hangs the board within a few blank cycles. In
practice I hit it when a KMS application exits: it frees its buffers
while fbcon takes the display back with a full modeset.

This issue can be fixed for me by moving vop2_reset_assert_deassert(vop2, vop2->axi_rst) from vop2_disable to vop2_enable.

--8<--
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -913,6 +913,9 @@ static int vop2_enable(struct vop2 *vop2)
 	if (ret)
 		goto err_put_pm;

+	/* Reset while idle; doing it in vop2_disable() can hang the SoC */
+	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
+
 	ret = rockchip_drm_dma_attach_device(vop2->drm, vop2->dev);
 	if (ret) {
 		drm_err(vop2->drm, "failed to attach dma mapping: %d\n", ret);
@@ -973,8 +976,6 @@ static int vop2_enable(struct vop2 *vop2)

 static void vop2_disable(struct vop2 *vop2)
 {
-	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
-
 	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);

 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
-->8--

Does that work for the cases the reset was added for (the RGB <-> YUV420
switch glitches and the DSI panel on the EVB1)? I can't test those here.


Thanks,
Tim

