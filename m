Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C55606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNslcoE4;
	dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.a=rsa-sha256 header.s=20240125 header.b=h4Yto5rt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GQvfNp65FBXmcF3uK/s2GXnfQ0y/t47EhDsCV7hVUL8=; b=HNslcoE43sQDKd
	yskOtIgz6K0pizFLcjwx6Ys6VZuRO5EWaalaQXMcwmA84xjmUSMYQmYFv8+le373qTpLZB0KL6zTe
	sRnGTYB8rqz8rdTrbsGNqH1RE5LP7h061Vt8kEFHlnC3DHvVd3328ZME0DjXXtvILSn4kFzxtXWmr
	zpk1Eh6XxzA9yAULgFYciOTgrAcppwp6U70YZHDuQe6RSO4FeDW+InfzY6Wxw8lWeqIXHK4htTt56
	hzzos9DI9MqVdS2C0CcSTqVMOrytCWrHl6/fd13k1ljl61BROmI37Awkf+wCPoZhQrEhffMEUyu20
	0oeQrAD+iRI8djuy7s2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtJb-0000000FdCo-1T2s;
	Sun, 08 Nov 2026 03:11:31 +0000
Received: from ocn-ckd-mts-117c37.ocn.ad.jp ([122.28.128.102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPtJW-0000000FdCA-2ykZ;
	Sun, 08 Nov 2026 03:11:29 +0000
Received: from ocn-spm-mts-103c1.ocn.ad.jp (ocn-spm-mts-103c1.ocn.ad.jp [153.128.190.230])
	by ocn-ckd-mts-117c37.ocn.ad.jp (Postfix) with ESMTP id 974F34003112;
	Sun,  8 Nov 2026 12:11:18 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1794107478;
	bh=GQvfNp65FBXmcF3uK/s2GXnfQ0y/t47EhDsCV7hVUL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4Yto5rt/S4/h7ZlyTQ/vq17Y7qA0reVKb/xAGxFXwDU7A8yUz95Z+5WvGn+N6HvZ
	 A4Nb2mHlH8YR4FyUQuYE4QbF5Fe1JS6fqqLrQRpbuIGoGdeQOXK7NAL+pgf/Ih0UO7
	 eNPJQblhEB8UR0kt1UFfFk/Ggo88Zgy27JSjtSmg=
Received: from ocn-vc-mts-108c1.ocn.ad.jp ([153.149.236.202])
 by ocn-spm-mts-103c1 with ngmta
 id 811bd508-18e5f33f0194fd6a; Sun, 08 Nov 2026 12:11:18 +0900
Received: from ocn-sdpx-mts-113c1.ocn.ad.jp ([153.128.117.211])
 by ocn-vc-mts-108c1 with ngmta
 id c06a01b4-18e5f33ec017da7b; Sun, 08 Nov 2026 12:11:18 +0900
Received: from docomonet.jp (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-113c1.ocn.ad.jp (Postfix) with ESMTPA;
	Sun,  8 Nov 2026 12:11:17 +0900 (JST)
From: "Shigeaki Asai" <y-asai.0816@docomonet.jp>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 John Williams <porschemad911@gmail.com>
Subject: Re: [PATCH] drm/meson: encoder_dsi: load ENCL gamma table while ENCL is disabled
Date: Sun, 08 Nov 2026 12:11:16 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailer: HidemaruMail 7.47 (WinNT,A00)
In-Reply-To: <022f5372-7963-41b1-ba76-2d89c51aa8c6@linaro.org>
References: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp> <022f5372-7963-41b1-ba76-2d89c51aa8c6@linaro.org>
Message-Id: <5DD6F2ED1CC4592F3006A@docomonet.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_191127_123178_213ECDC2 
X-CRM114-Status: UNSURE (   3.50  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/4/26 17:31, Neil Armstrong wrote:
>Thanks for figuring this out !
>
>Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
>Thanks,
>Neil

Hi Neil,

Gentle ping on this one. It has your Reviewed-by, could it be picked
up for drm-misc-fixes? Please let me know if anything else is needed.

Thanks,
Shigeaki

