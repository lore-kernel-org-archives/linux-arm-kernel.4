Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B12606A896
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SSNekgTF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZNsxKEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2VlHcIVlZZPb1dKLE+NitYN2zgg0+WkasLdpA/Aa5UY=; b=SSNekgTF1eR8DgxppNcJDEbfSP
	BrRo7h5BSX2nR2Vr8n0AzECJmGtdQqpyHq4LaxTU4v3pD2qXixeMzSf9Gua5OpEKAUc2eNuwo/qtT
	Dw+vD58WN9LUNjFt4UfSGFr00Du1eXd6tvhyPpWk+wLzKkk/lcTITh/93A/ZBdhHWtRovBZSV80zj
	b8c7RSdSRq7bdjesZnrD119GmSUQVRm2Z5qrUsYX5jBLumSeJ2tEG4ac84U3mM1V/qT3Vy6Rb3/lW
	z8kSK6qdPP8Y4yQ5w74AwXMKS7xuOkn6G6yWobUoyMw4oGBOOhSXZ2X8FXKDh5ct3P5uC9h0pnEAL
	gPfB2s0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoWo-0000000CMqv-28cw;
	Fri, 13 Nov 2026 10:29:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoWn-0000000CMqk-0oAh;
	Fri, 13 Nov 2026 10:29:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C417544798;
	Fri, 13 Nov 2026 10:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDD1F000C5;
	Fri, 13 Nov 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565744;
	bh=2VlHcIVlZZPb1dKLE+NitYN2zgg0+WkasLdpA/Aa5UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MZNsxKEmYGHH+Fxv7YUDO4n6WwledjMk8ShFPN5VTLJqx+QwIYK6OteOVT9MtMRyt
	 HZqF72CO5iXpA9DOPsk43UWfkh2QsLDZWKf3UJGiGy763ZsYzpCiaiD99u6d2Wgbar
	 e3Oxq8D6Ax3eKHviF4mad34+RMQ7+tlF8Jr6nxCVgg81KygZUoWBgULspW/SwrpoLT
	 ih2Bst8gCZYky7kjv0+ZwvadHeP9B2jpwG5eYs8/pLqsSo9S64mN9qcGzNhSQ+tbP0
	 IKnZn+o6FxsxjiQhlJYP2etWWglBjSh4aAzfLtimKwwpoiA09++0WIyPkQZNc1YxHP
	 pSpBNcSQ18JrA==
Date: Fri, 13 Nov 2026 11:29:00 +0100
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
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
Message-ID: <20261113-inquisitive-spiffy-chimpanzee-d25ec3@quoll>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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

On Mon, Nov 09, 2026 at 12:33:18AM +0000, Stanislav Aleksandrov wrote:
> Document the SMMU-500 on the Qualcomm Halliday SoC.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


