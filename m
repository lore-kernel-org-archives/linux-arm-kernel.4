Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lbjz+rVJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugD1fctV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=; b=Lbjz+rVJLHAAXBfzBijONXbOnS
	itq2N77D337WFkSpECPJJhDv0U+cBKU1GFO/6F1eq8knCfilBhGYNH7A+BNiBTPTJs3/JCr13VXAH
	8jo2OilTvFtKwK9+pOUIvx8u4eFDfQdJYHwPUHzkEih6Boyt+7rSvuJVwLcJPVFSOe/V24xusGbzp
	9yamJxlJbCewCzAW62oHpw4yoz4jiEfEbE2P5L4Ufg2WcUfxritK8oPczu7b5hFBWVJ+Hl0g4bTp8
	6LoiOwH8XkXgM23s/TmfFqZqVAh8ue023iadBgoEd3xdZqqVLvlxW9vqq933AC7QK6c4DBVZzJBz1
	UJN6GNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlUb-0000000ElfK-2KuX;
	Fri, 27 Nov 2026 02:15:17 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlUY-0000000Elec-3bmZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:15:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso3065023b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745714; x=1796350514; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=ugD1fctVKFsd8x3Mhws+PiTUGxnsAz9iRawCgprJH4S1uACiQ6qn/2LoDQFRiwq2Gy
         hCBJoLu4k5E4Stjd2+c236e5AyopSaEuyWOPO1eVQ/6sbkgEBGaMJU2Me/0EYUGm8DRQ
         E+r2RXEGjXFKfcMvP9CZt0178OePX2lbvmP7n+JDmOEzG50nR7eUmSVA4GeSFDGkVR8d
         h9x6Jm80sN2NIdNzOely7qyAezxs+Vfs26KfSMFY9pN81DH2gxwlGOnMhdShrDZN22qX
         oVhlE8mR7ElbDyoCxatOIfNR0NMv6ZF/T11S44KfYoX1SyFMtgphcvigIwqcGg3gmepp
         5Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745714; x=1796350514;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=SSUJbROrx5K0NM0wq49VgWXzWVQJeAuM3QkeXeW8upTciclYdMSWwFBpx3jNBbGSvP
         uU+maSwFXQR2REpqI8mmlyTMBxaaVwq1aygykjiehQisqyrpSfdPwNkZtg8EQ6nNzmYE
         iAq1If36QdKGaTNIe0/JFT6w8liBj5A5ZwEG2GgzPkj4A+y/f9qobjuenNaHTLGi9Eym
         Nf9LHtJZdDFCg3yAcvHNCqPbKNyzk3Eesl85hpdSjXku4pOQWaH3A5oKOADL8+Tsih7T
         WNMQclO3Gt6wvsJ05/bbXLfG4Tm+iQS/ppilQYG/qZgp1rBjGzBMZZFzqyzb6019f7zV
         cjzw==
X-Forwarded-Encrypted: i=1; AL+hErFWAbZSjx839N4oARUBMloDfZ/PWRIJRAOYxEIy5rRxX96ySF7Z2AIFoB8rhAtETgWba8UW4UTk3nikftCqNM/O@lists.infradead.org
X-Gm-Message-State: APuU4Z93+X5hNhdehECgUMJJCNnb6d8Z4569vn8M17sULBRUutoB95Ft
	1SoWxDE0joCq1uhOW2u5aiCA8dtpb9GbgcCQibkbEbMGV6IdL4L1hK+A
X-Gm-Gg: AZFdTZcUBJ1Z+S/pPLWp4YWhMmoKO+sTkHy27na99ZIHqzHJbjUbe6Cu+NKxWUffXsI
	NlD5dXVDmvMoUMPk6x1AEiCvcucjlYsdk7l8Gu0PaYnLL2ZF/WCBi0bEqLKq/7AZb3jePscKoRS
	tXVzmTsJ+yCsLF4DE+ZngWGjVoeplr1KKyP+GdNjMrihvCByU4QziWmsNM3bBQKm2swfYT5rbB5
	6XA2r8qj6YTkkzNbyDdES1K4FwRAUX9ku0WL7bgxz1VhlPkmkuUKcJ3iuwD31iSsgJcYWCVRNDX
	P/7tPrOiIgJpf/IWE2Uh20X11KZSW0ELfGSkLWQd4CPP2EnnGuZ8eV/DelurLfF68zlgIQZDD/s
	N75L6dopb1iDgV6Hr+AtAsb0kwXCNa8/08effV9nvxucRI2cJz4sS1IKNJ7m8GbMfQwDguO8MpD
	DWdbKNynZ52ZdOuAQ3MHlBjRbU9G9LyZ7fz/kX5Woe+a7nzGybxnva6/lTM82lBLHopc2fcxeAR
	Eg+rHZdSWZLKPvuuU2QBTQMeop7lWD5x2+dzMX59EHdVzpXD1yvgK36XcEswjJk+gTSkQBuHJ0l
	N9rnjYfTX/kekwbiGbuSi9LF0aC7Lszsok8UqUm68mIubIcMsy4IbAO6/VnVYS0Z6z74QLXyo3w
	=
X-Received: by 2002:a05:6a00:c4cb:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8c922b00017mr13559729b3a.52.1795745713852;
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm11807929b3a.5.2026.11.26.18.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 amergnat@baylibre.com, leilk.liu@mediatek.com, me@adomerle.pw,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI support
In-Reply-To: <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com> <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:15:08 +0800
Message-ID: <179574570832.2422.15788597758077074271@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_181514_897226_645F20D8 
X-CRM114-Status: UNSURE (   5.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Good point — there is no dependency between pwrap and spi here. I will
split this into a standalone pwrap series and a separate spi-mt65xx
binding patch in v4, and move all review-history notes below ---.

Best regards,
Ilia

