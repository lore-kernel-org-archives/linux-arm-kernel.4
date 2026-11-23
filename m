Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE01606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQhhg+E7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cu5iR40U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VRuIav6YHmvsMLh7gooEE44y2XxBVR4YlFmEfHcC8FI=; b=IQhhg+E7VcwhJleguqmW/fOWsA
	0KYVEAMYumjpOeq8EATNa84cwP7HWK/ZhQ/+C9vkQRLAdJh31GnevQQI0EFZzadLRX4jKFpxNPxzV
	p4nil6Vj8Djt5ruT/CGFpZumG+xH/foUj0e83hs28tVa1xUpZ9GDT3M7R7XAfT6dWPU7o+0gPhXiy
	hCSHeUOY7Gz/U1gUMKky3z9mn6a6/otzs5NyYQo1jKrH/dB5ULG77ia2j1WDgD0rkZ+D9Tc0z/Zx3
	t0XJ5lojM8Lm5clgM5lr6CZjbqX4zMGoFravJR90PTHrkjI5Fs1yV4+IOXXv/f6wkN42MN5qmFQA3
	PYN1B/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSrE-00000003Htb-2rTz;
	Mon, 23 Nov 2026 12:09:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSqw-00000003Hnb-33d1;
	Mon, 23 Nov 2026 12:08:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B30B4583D;
	Mon, 23 Nov 2026 12:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9EC1F000D0;
	Mon, 23 Nov 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435738;
	bh=VRuIav6YHmvsMLh7gooEE44y2XxBVR4YlFmEfHcC8FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cu5iR40UMCTAEJ2wd+p/QNZOSHA0mxj629+dI25oJd65SS6aiEUmMtuSP+EfqBpzw
	 P4bLrKFTX+y+WWgpS+CeXywKXfqZeHWEzvyA5bfU5ZnxkvF+yZwvF+G0+lnZi0a8c9
	 tIPT2c6albgAONuFapnuKdUFG9SEC6xbweoTze+swOQyd3lctsBOYmzEacZe9CdUMk
	 YHIg5fEmkMer30U7Cl+qQNqfsvmpbupBrp0Jfu+IqXUOfj8wp6ISR41AL2a27PuMQu
	 smXmYbXn9HrsGtjA/oFOXfqLbcRWx1prekSdgW57mJpiqDPNjsGwqlYVgE2by/qhRx
	 fRE4ldhhSfcJA==
Date: Mon, 23 Nov 2026 13:08:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
Message-ID: <20261123-calculating-auspicious-terrier-0bf9fa@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
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

On Mon, Nov 16, 2026 at 09:26:26PM +0000, Stanislav Aleksandrov wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


