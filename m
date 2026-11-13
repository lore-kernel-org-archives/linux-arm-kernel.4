Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIVZU4ms;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqIs+7bC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=; b=jIVZU4msCaE/93
	+Wh0KxLLur0P0xlaX4JrYAAgPTomQFzMCLDk466iB3IoBQg0efhpdQQPuTxx3wWJl9XLlKBFAI8QA
	v731Bkg+QzUA6FZ4ZbAtOn7Iyg0mvR8tFWDUXM403884geI9m4fnr6abg31rH3z4IoYWnjxFFRWxb
	HYyc6yrOMrqsAgcvAF1NqdEMrn1mtDQsZlC96GndNm6RcJexOmFxmBdEzLXqohVv/YUQqwNYnC+mw
	Bsgqdd5l6R09Wv9rRrnVC+7hj8oLhD8KT5fGfm/fB942mdYuZEOLf1omRKHM6AQeXX1UtS3DmxPY8
	lFnM0CKFALEEGZdjamSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm78-0000000BxE4-235n;
	Fri, 13 Nov 2026 07:54:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm76-0000000BxDA-2rIL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:54:25 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3ab30d04674so1045961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556463; cv=none;
        d=google.com; s=arc-20260327;
        b=kE92uHuQxPAPOIaJwkLFYYO668sjWK1435rUSvVWFjUGJoK0gWfmvcNtERB4kwNgIO
         t4FcvGvCgUMvYBsU1W/jvjy5uH9mehYoQ4S57m/A93EFOFBxj+v6VGzFEth9zxvPIay2
         fKkLsFofAO/02J0mKPwStTa0SrVHIdk5wcAZhr1PT/a4+wCy4L2NeyiGOHIY/M45XWXY
         J37ybkesc5cEx4mb8cEfoN7NKk5t3TR9gKQS28kcIxG6Yyra3aoR5WOM2TLNz7HcD5dV
         GREh5WiZHJb/IcmdNDMh8m5WTQ7lQbQfPlge3Dz9E98/IYuj8tsjZ3I20mFlmuuLZzmS
         +W0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        fh=pIL/Rk38mKDxE3KBd3Bd142oEUSa37NfrGz+NvG9/NM=;
        b=hBvyIST25xHLVqXL1rv85Ot+/X9WG9T+b7nvXs0StyePoq3LBwyHyQoXUTrIXffEhp
         d0f2T2KwO0x2X8dW3maeQUEXA/LB5UZFUtA5/AA7Kwf9slXzkm4+VAWOAg7ysZujsvo1
         1eQjW79gxoNXBsjbrS7i1ssfkfHF1zb982BvcVwv8KYPzi/IPV2AOp5wshHdAPQLfFsj
         RvIzD9DxJ5gCsYEQkjdsc627mYXQIow4r0DR0EPsEuiTKT4VVvTRFqg+0q1C3u6Dyq1c
         RxeRJC58PQNO15N0srqyPo1nLIHFIBPtqChZdBSV2tJgMfeTfCPOf3D5/LpuRNJMV7K7
         zVMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556463; x=1795161263; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=lqIs+7bCiFE2Urm4NyOe23V8EnOFpSaD/381F4r0Eo0zLxRWd+XPcYRWvrg/0JO9hl
         sa7MxwuZjqq6w8Xx0u1gVlk8fFwVSfwje7pgsnwnJ5WIkYk11k1o0Jblo4InyVLzxS8X
         zyvqRGB7QV7eLe1R3Gm8DtnLVl/e/W//qTFGEqcz7An7Vf+2gOoVFq2wQcgiLoaPDL3b
         bB9wG8q6D/xVjAEBE02qhlkZY9Kq68RHdADl5+SKGIA18zhckGw8EVZaRz392A3zgiUo
         FmzdE+JXRnfIBYtA9Lik+aX+YOLLfDDK82CMR05WWeLVMTpP9I7ovECjWU7LP/u6yWXs
         htuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556463; x=1795161263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=0je5JEw5QLu4lcvA4JBHtcsi0m9R34UYz961KQ/PlVbxCyObJnboCr7XmtV/cSyab6
         VM2INe83ANQvhayYh+WRkuqcIXs4XU1IiETf1Uluzoyvj+Uib/60z6Ht9quw2q3/HUip
         KALVim8CU177gGvamrcO/ZOEVVObrZUNEkotx4FH2L+qkL3uYtIXsUOt4rkLcWR/GXRa
         H+7cZulswrBaEtXX2GtEch6xkRNjhhmDz2KDp84euVCQJSsNxPCuAGpqlKTqFDUziOF+
         MZ99DU+DLU6qyysSL9zS2sdjtyxQE0zHn8hkdRMagSK+ejoK1YKV6t4fro6q4UIW9xZ7
         QWJw==
X-Forwarded-Encrypted: i=1; AL+hErGx9auxOicKaeUYnrr8bkxiv+uYygCOYoo1O3NnwDWqPlXVghVhJ7r2CnP0zLrtJ+pqQ2dkBuv/7kAnmFQUk4Sa@lists.infradead.org
X-Gm-Message-State: APuU4Z+1KJVjJZ5cufHdZwo8vvgx7VM5J+Nu6unEzzX91E3JeUo1NZN8
	nQu5S0Ocvhr7ITlqLmsBx6o+QRQ+Lq+h22+lgSFf3IbGPIzbiyXHX+yDjiEeQuZpGdiFdKT7LoQ
	URqRsKj3MrRvDZ0dcsTgK4T9+cSpeOkM=
X-Gm-Gg: AYBFou2RCUsJYPlVOQGx26tUykaLs1yTTPaNlDbLXmkTN8uy7tcDQJBUc61LYUU0Xup
	PwHp+tGkt6Zs2kPWRfhjV94oDoGgN3YYnU/IErRsTVG7sy0cykf7QWPB/6ejbcuKUTxRXY18kbf
	uLXps7pXxA5KyukUyCaZz9dhdbFaxeKa6HDkAs9puNzQkmpxvl3gMT8FvG9k3qeboZB6cI12ymy
	jxSmJSQ5/N8gF2foJ06ROG3MDE1GGVUpDgqMOFFaz7q8gJjSetBzjRt7N+IcM/fckkYYF/iX+C1
	wmbGi4N9XTZdee6CHoCHnpliEG7cI67ifY0i0muCiMuAcayDwLLnTLLowzYK03NdvZ54sI/0NXm
	4mP3ulpM/RD6JOdjq2bxH+W8VKa0lj79iiV9suak+LKRA2V4/y1aF20aKeL0lq1RcpwbA/XI=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr787433e87.0.1794556462452; Thu, 12 Nov 2026
 23:54:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
In-Reply-To: <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:54:10 -0800
X-Gm-Features: AclHuK-bvo5dDl4JVbgBvuOoQVFelHqw3mvt8zCrdDgOeg2cHm6xn5vl5OrzWyU
Message-ID: <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_235424_765175_14078C18 
X-CRM114-Status: GOOD (  15.29  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Le 12/11/2026 =C3=A0 11:19, Philipp Zabel a =C3=A9crit :
>> If vsi-iommu accesses require these bus interface resets to be
>> deasserted at certain points, why doesn't it request its own reset
>> controls?
>>
>> Depending on implicit assumptions like another driver not asserting its
>> exclusively controlled resets seems fragile.

The AV1 node lists these resets for hantro only. vsi-iommu would need
them in its own node and binding, and both drivers would have to move
to shared reset controls. Device trees without them would still hit
the SError. With this patch hantro never asserts the AV1 resets, so
vsi-iommu no longer depends on what hantro does with them.

> There is a side note on IOMMU doc saying that once the IOMMU has been
> enabled it can't be disabled for security reasons.
> That means that writing 0 on VSI_MMU_AHB_CONTROL_BASE register in vsi_iom=
mu_disable()
> could raise an SError so I would suggest to remove this line from IOMMU d=
river.

I only see the SError after hantro_remove() has asserted the BIU
resets. vsi_iommu_suspend() does the same write on every autosuspend in
normal use, and that has not faulted here.

I don't think dropping the write is enough on its own. With the resets
still asserted, the AV1 domain is powered off when the IOMMU suspends,
which is the fault 8e26d4c20ed2 fixed for hantro's own suspend. The
next bind then resumes the IOMMU, and vsi_iommu_enable() writes its
registers, before hantro_probe() deasserts the resets. I have not
tested that.

If you would like the write gone as well, I can send
that as a separate vsi-iommu patch.

Arun

