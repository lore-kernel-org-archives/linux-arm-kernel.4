Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C30F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xr8uQoNV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ih23mt5/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YUu0h9arLHi+h5Yn+kYOg06kGKRl9ThCJwlOdeMMI08=; b=xr8uQoNVggLsP/
	Ey2pMUH9ZCdMsLLNF6rtSQrvMd46VeriPJE67nQcao24WYQyxCuGzlnaWcV6RiBqJtbojGGraGVhs
	NPwOs3YIvsmYDTjUG4Ahhl5HNqjF0EPyWmv57JI+hWvuEDOe5GiIc3B/m5lMhOfdcfHtmd+3vQQtz
	Axqli1AGMAZ0hzRLFrSTuYgEQTxWyZJNLEx4aUCM8mOzG+nJGvJm5FASNm7YlRxRLjzGZ//xJDvXQ
	R1EziETtVV70KWRtY13btpqX1D6yXkJcMJgOVFqbtYe2XUxsLMMumMb4nfCuIFRFupasMEkEUIDrp
	L/FVafCHg6sbV9/YXhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl8M-00000003sRl-06Uu;
	Tue, 10 Nov 2026 12:39:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl8I-00000003sQv-09Hm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794314365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUu0h9arLHi+h5Yn+kYOg06kGKRl9ThCJwlOdeMMI08=;
	b=ih23mt5/mkDp5+ZpAh+H1dl/mORgP+E21Y3hGGD0hdOeGGlDc/9YHQ6PXkpr4aWqTmLnjB
	QOuzS1IiAN6HtLscXiQX9yOAvxDjXha4fsDbcJ5/47Ps11f0EgxCbMdvxk0k9yYmrzci4y
	+dUWL6XtOTdc1IMEWSHJ3W4s79Hj1x0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-pcCWKRqxOtCCcbT6dQdZZg-1; Tue, 10 Nov 2026 07:39:23 -0500
X-MC-Unique: pcCWKRqxOtCCcbT6dQdZZg-1
X-Mimecast-MFC-AGG-ID: pcCWKRqxOtCCcbT6dQdZZg_1794314362
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1887200f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314362; x=1794919162;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
        b=VtMeT0iM/YlAi8xciCCavMmeisVdEN5fiJyzAy9JUCbiNBpT7d38kuLSZZk9sUWq/o
         b5yjwCET4479vfGp0Ej3zGv7EUPLD7Y0QZNdqzmcoSKjw1CAyR/21hteN1uvQCM+wCKC
         VCUUrO9SzmYIWKtM6rUrS/ok64wvn6jBDrnEPVpyYKyCoiSRM+Iy/E40C0AiQiX8gGsk
         yZCyjKB45Kof1wXv7yRItpSzdnWIEQE/vt9ifo5wxdggaxJDPyuU2lq8BqPl45330lqQ
         G4Cv+hAEXrfd95t5wU+pnVDzBT6xjPymm+404XnlXAW87x5I6PxWPihXgUe2tKKU7o89
         +VEA==
X-Forwarded-Encrypted: i=1; AL+hErH6t1JYn8Wc9NEhASCvPTRqTRF4KdWx1V1W5q5N2lRD2XzT24m2h1i4OX6sYj/mIhaJjdQIuA8WsFLp+VXROWTn@lists.infradead.org
X-Gm-Message-State: APuU4Z8O9MoRZWIp3Xq/cz0+rCh//0QD2YK1tGFYRWOwejN4BC0cxSAd
	bilWCIGrz64HjB5+YxJCQoLM4zplTFw63qv/qncuflzxW9UUaB9ZPBUE5qJMSVl4PH6B1e5smsm
	EwFEOeSVN/jzQcfwXsuY4rh8us0PDJLS/A0OAC1WTwDOJju4qSsxgsYUGW8rOK0+ESLjoopCHvG
	h3
X-Gm-Gg: AYBFou0dFlEKDDlyiNhhD81GxG854i8FHw25cHMAtYAdkhpJSFKw/wAyYj9yB7/bB2V
	0Ztedw+V1bhB4f/iNVY6e3kCSZr7DhPuhRmQEjrAH/1Rx8y0kD58c1qRsNT1KGppEW0XrIh1gVA
	gAP8P+1CjptrZNNKiug0PI7utH8bpGPtd8jQBBpeIFTRPjJAc4YOJ1aQg/g9ac6HTFGPs60/E1z
	PBFq/VNyFFuBJ9fA6LB1/S6fgfzPUvSN7M/zJWVkC7CiFnbjRnhq+2v+6SzYIs7QB59xqRn/tAz
	dg8udKXZ+xonzcRbmIeuAEK9MOjNdKzoNqIBRIAQTZnKA13DiK57SeFsFzrF34TiH1E6aZCRkV2
	stwygV+ow8BMNmYe+zrCjTY/k+0MC2LdomPulH8Q7ybpW2Q2sbzGeZhjPBHAcK03W1PzWkh+oFV
	o3dwlHej7FoLAe6x6oO83+j+wlg9+CVgUTFfESV8w=
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45491505e9.35.1794314362120;
        Tue, 10 Nov 2026 04:39:22 -0800 (PST)
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45490665e9.35.1794314361627;
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm71937455e9.6.2026.11.10.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Devarsh Thakkar <devarsht@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devarsht@ti.com, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 00/14] Add DRM driver for Solomon SSD16xx e-paper
 display controllers
In-Reply-To: <20261019213726.4145532-1-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
Date: Tue, 10 Nov 2026 13:39:19 +0100
Message-ID: <xlv1o6bweu88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 70x0SUDPGYn2g2DN91xieL2DkddxpCBUWWgeryl5yVE_1794314362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_043926_148351_4CA17887 
X-CRM114-Status: GOOD (  12.69  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Devarsh Thakkar <devarsht@ti.com> writes:

Hello Devarsh,

> This series adds a DRM driver for the Solomon Systech SSD16xx family of
> e-paper display controllers (SSD1673, SSD1680, SSD1681, SSD1683), startin=
g
> with support for the Gooddisplay GDEY042T81, a 4.2" 400=C3=97300 black-an=
d-white
> e-paper panel driven by the SSD1683 controller.
>
> The driver is designed and architected keeping the bi-stable nature
> and low-power requirements of epaper display based systems in mind
> along with having adequate flexibility to support varying use-case
> requirements for the e-paper display use-cases.
>

[...]

>   drm/solomon: ssd16xx: Expose refresh mode as plane property
>   drm/solomon: ssd16xx: Expose color mode as plane property
>   drm/solomon: ssd16xx: Expose session management as plane properties

There is a fundmental issue with these 3 patches. They are adding custom
device-specific plane properties, but the KMS/DRM subsystem requires all
KMS properties to be generic and standardized:

https://docs.kernel.org/gpu/drm-kms.html#requirements

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


