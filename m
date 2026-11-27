Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D125606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuXsnedn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePJclbi8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IcEA9dPcTlpji09bXny7ezXUzoQ2jqu5L/vdXff+2iI=; b=NuXsnedn3Ou6Ju
	HDoUE9m+JwagSFP0jS/jEjF74lFLxxSF30heiaOuHDeYKuadVfi7UYzwMuKE9SBYD4Ln1OhWY0gUh
	tOmsSBOK/r5wDJPj3V8/VDqCb+x8gSpkBDgVuJjbET3g/RjCuPjuIbqlHOCht6txj2pDSLuYywrCn
	ExsLXtN6ZyEcOBhPzMnAHJMVpSNtwEROcpYPVS4U71gFqFrQwsyBbMmE8wMjqrCFDrk2GZMm56stl
	hsnjxf06fWHQKelGsGsE44UmRorQstqM4LaAzXLeMB/G4aPdUAWL/GbK5nVqpLhZc8+U7/IdpYOIH
	TTfNaoyN2y6tqbV/Bk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtWj-0000000Fg2W-3A1z;
	Fri, 27 Nov 2026 10:50:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtWP-0000000Ffty-3Fo5;
	Fri, 27 Nov 2026 10:49:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A225412D9;
	Fri, 27 Nov 2026 10:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3CF1F00926;
	Fri, 27 Nov 2026 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776580;
	bh=IcEA9dPcTlpji09bXny7ezXUzoQ2jqu5L/vdXff+2iI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ePJclbi84ZZO1HynMHU6EZ/+5DN+Ag23NvYsf6I9ENlea9KmJR2bKDu2xsRTgNr/u
	 sbabWgtrv1X/kP8CP4eqVuPcmt0p0ib2KZ8ik3jI9L+EejrQSQruVFwqqdPACWdCGk
	 Sllde/YIN+tc0dy9vvCPaMet4petTylf3Lbj/O744yCCvvaqcRRlUVmIPUtjGA0e5+
	 ZaCX6/OXjOvNjlTxiCWZB0+uW51s4/Ve6bJpqMyl2nU4JsxSqDCA4ZLhBsudt+tqWb
	 jzJQiVe9/e7Ky0jgrsGb6Fh3nUm1gllKKccCu67WdCoIObdSIhGnYVei7t7EL43ECq
	 gee3z8a5hrRcQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 7/7] phy: rockchip: usbdp: Add DP lane setup to
 power state update
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Yury Smirnov <yurymonzon@gmail.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
 <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
Date: Fri, 27 Nov 2026 16:19:31 +0530
Message-Id: <179577657153.3421.994234967991437071.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=mani@kernel.org;
 h=from:subject:message-id; bh=iRJSuUy+SAo/tkGHxCiOt5iyW9VDqeVLmgn8opG8SWw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWA+eKy4RGmNpnPAXM7J0CYb9Ln3q1ViRZtTb
 ZD0qD9eVu+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlgPgAKCRBVnxHm/pHO
 9WQNB/994YBqzxSkskHsh6yfJEEnIP9O10oejnnuT4tSbUhaNqeqLXS4oUGDgnH/RzcJzeVpSJ0
 OT5iEUMjEFodXHLQ9hnOzxzl+GRf7Tmybqrn4hJuWu0IVepatW4Fv/mY0zRtZT7dJ5YRFyCc3vt
 ccd7UqaRrEu/1YNqdC1f5dVqko30LOnq0RmO1Bmb7KD0dc5SFA5oZSl4k8z/V6I0Ee54IeTfrMQ
 uyQZWFkTrZ2i2MSsdBSNCvnPtxE3UslVGY0sVH2wGOabN/fkcFsXn7q+4vB6DhZC3sgD3zJ9t8W
 4YvcekKk7qbl8UQt1+xwkno8BF9CgBlZ9fQW5f62nW8GLYZm
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-19 20:40 +0100, Sebastian Reichel wrote:
> DP lane map and AUX orientation are only configured in the DP PHY
> power_on callback right now. This means when the DP controller keeps
> the display enabled after a cable is unplugged, it will not come back
> properly with the cable re-plugged in swapped orientation.
> 
> To fix the issue, we update the DP lane mux configuration in the power
> state update. This gets some special handling, because calling
> rk_udphy_dp_lane_select() accesses the VOGRF which needs the DP
> controller's power domain enabled. It is active while the DP controller
> has the PHY powered on.
> 
> Apart from that VOGRF may lose its state when the DP controller is
> disabled, so we keep the DP PHY power hook as-is instead of fully
> relying on the power state update function.
> 
> Reported-by: Yury Smirnov <yurymonzon@gmail.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



