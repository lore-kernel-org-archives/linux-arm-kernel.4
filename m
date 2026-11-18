Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFBA606A7C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K4/yQZVm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQqV9Ijm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TPQ4r972gb6bSnqkwDpeMVJfD/XRQzGlY4Q97PPUyYo=; b=K4/yQZVmXiSMhoDCnUKdZovofA
	wq1QuN3NNH7aZ9MLkk0gwpXLqQ0tNRbcwo6KigU4j6nYZYHSUauTMIps9l0hbA40bdNr3Jwrv+vT/
	5yewbsCtnmiyAUSBHe4H53N444/9lyPs3czG/W1IlnbBXUZPf222MjCbk/rkTTltex4bRZ++k+F4m
	BFqN7QyexnQ+aKBJtICJXZtC+rOgJqUDeoYZhl2zwp9J1xKrcAkBwZVVvwDIIVC/uit2Zx0Qq/8OX
	XhzMl014rofo8kVC6+9Bxvia+/kcHP6MD/DFNe3XD6+22Ql1oTizF/KlM0wzq+3MYKz12fdoWDTRb
	JkOPMofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTibd-00000009XZG-3Y77;
	Wed, 18 Nov 2026 16:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTibA-00000009XQb-0wcQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:33:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5881F628C5;
	Wed, 18 Nov 2026 16:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EAC1F000C5;
	Wed, 18 Nov 2026 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019606;
	bh=TPQ4r972gb6bSnqkwDpeMVJfD/XRQzGlY4Q97PPUyYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HQqV9Ijm/7Ci1l5XNmScFxz0OaYN7HbdfdDKUAQAWJuJiUe61iK7RZye9oXw5PD4J
	 Kn1OhIimTn2qo1bkZptDjQn8zB1qo1Lt4bi+j4aSM5iIlkcvs+G7Rh5zlsL5H3epER
	 pHIwry3MNYnu98eEEcGIWJ/Mm3aqGs7mxUHZVL2HiN8Fk8ilZUUckyqghNrPqPOCst
	 MQGrqei1qFNLW2wMsH8iD855p6J0ce2GBQ3iLfnvs22x3MO37IO6SwbYEpmG3EPCBo
	 b1XEcmMGAYYZU9dOCXbFw1ONbaYMW4cl/k69TsL1Kc8zad7/iSEfWkHJMIZGLsfG9e
	 jktwobo1GteOw==
Date: Wed, 18 Nov 2026 10:33:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	chernyakin.victor.j@outlook.com, cwweng@nuvoton.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dlechner@baylibre.com, jic23@kernel.org, nuno.sa@analog.com,
	conor+dt@kernel.org, andy@kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <179501960376.2868004.4446551155644027981.robh@kernel.org>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-3-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117082832.1551574-3-cwweng.linux@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 17 Nov 2026 16:28:31 +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add a binding for the Enhanced Analog-to-Digital Converter found on
> Nuvoton MA35D1 SoCs.
> 
> The controller provides eight external analog inputs that can be used
> as single-ended inputs or as the four fixed differential pairs 0-4,
> 1-5, 2-6 and 3-7. The VBAT input is internally connected and needs no
> devicetree description.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


