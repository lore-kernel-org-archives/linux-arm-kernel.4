Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=46aXPoX7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EBrzati9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ihaNk17hqENSXbY9COGf+8Q0e2XiJjXPQdUUyev7UHk=; b=46aXPoX7tqFtKK
	qrZH38DUeSbgjD3FJwEsYGXHYCdIpFPLuJ/JOu5Q1FnMU2yWQi0pl0avKa1mNmmZHpnO//fg+9e1r
	/lVi8L5F49T24StRwnClGCZr/CgMitnE4h+Y3Mx5BBXcbfi1j51k+L8ImZJ5FPp56tECsPLuIM/Ll
	Pe4hIJC7qsEj210PyQI16WRvb04B+7e5ito/GBXeV/1EsyEd/xA82fEWfGfBywyhGJLA+ipHdUwFa
	EJEG5HlgWQNlysVeNmksrkWSl/AUuMXEiPBwCA6QVACb6YSqzrR7m++ImGBbZhNoIU+goiuH5UqEz
	lx+yG3O1t/9U9gP/z0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwPa-0000000GJV7-1Snh;
	Fri, 27 Nov 2026 13:54:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwPY-0000000GJUx-1X0R;
	Fri, 27 Nov 2026 13:54:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E062960E64;
	Fri, 27 Nov 2026 13:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B21D1F00893;
	Fri, 27 Nov 2026 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787686;
	bh=ihaNk17hqENSXbY9COGf+8Q0e2XiJjXPQdUUyev7UHk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EBrzati9JhcbB2R9MVAsDvs/3N6Vf1bh0Aooa1tg26NApbNA1dZUlgFy7q9FHDcxF
	 pZTMotJWV+a6HtIPzZKNausCBV6Fg6CNo60U8ojPUYPIe62LoyXKaPshYUZKu1c0VN
	 8bSRRe7DUvAJyO+wSnJRAA2S+Ph57kUimsl5vIy8YkkxJmepEq/UPFwqQzWbrYJmNl
	 XuBFLMPPA26+L7aSjqmru2GCE0/rFUezd9LcOFx6xmlAW4AQDwLsAS+UCSXfvLrpF8
	 CL3thFbuTn1DG17yeQ+wrRIpy6fPt+4dQ2P3d5vta4sqYiZB8q/EW8q6ZpQbcZP5MY
	 NtTzH8tclBZbQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/3] phy: exynos5-usbdrd: fix HS phy init count
 imbalance on Exynos2200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Soheyb Boulaa <soheyb_boulaa@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261114064400.45572-4-soheyb_boulaa@proton.me>
References: <20261114064400.45572-1-soheyb_boulaa@proton.me>
 <20261114064400.45572-4-soheyb_boulaa@proton.me>
Date: Fri, 27 Nov 2026 19:24:38 +0530
Message-Id: <179578767823.13164.4595964054834995547.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=mani@kernel.org;
 h=from:subject:message-id; bh=moU+LPCi/fmXx4hUo8rYp5XjV9/dvpjSZdoJhSaoZnI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCYuhDHABi5d4RO5C0tclXwG3gZMS18Mt9rZYQ
 xgayjpt5FSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmLoQAKCRBVnxHm/pHO
 9UYYB/44Ifkb6x2lMRRwQqwm8z+PFDfp/Kd7Y7xK7P65lr4oG7LHKgHYysohIcfbkDRH7FGkR1f
 ecofjz7Fz18DVur6zlCgp9s19198l0YjtM5PpS8U3CWrfNCOWUg6dwH+VvO7lUifvZMlF2L9Tgw
 2GtLfpsQ1q59Q4KuUbS6q9bVpWdUdYQX9aCn+osfepYzVxrfQbMyp5zObPdMOxYrv4Lhml4QfvP
 USFMxBhpc5RVplx0MurolHM9hgDG1V4l75Qr5tIR43aJUpnLEKIhMwj+4Ce/Hu59io8vCzaCs2c
 w7AVM5hiWTvDqdW+4My0Ii35ijvNrWu7CYG+DmUUpSq9Y6gp
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

On 2026-11-14 06:44 +0000, Soheyb Boulaa wrote:
> exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
> but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
> count of the high-speed phy therefore never drops back to zero: after
> the first init, every later phy_init() of it returns early, and its
> clocks and supplies stay enabled across an exit of the UTMI phy.
> 
> When the high-speed phy loses power while the controller is suspended,
> it is thus not set up again on resume, and the DWC3 core soft reset
> times out:
> 
>   dwc3 11210000.usb: DWC3 controller soft reset failed
> 
> Exit the high-speed phy when the UTMI phy exits, last, once the rest of
> the exit has succeeded: the phy core counts a failed exit as no exit,
> so the high-speed phy has to stay initialized along with the UTMI phy.
> 
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soheyb Boulaa <soheyb_boulaa@proton.me>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



