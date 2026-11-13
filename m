Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7E606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X2rt8EId;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3B3iDM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WSY+ANdltmdjp4hZAqbq3uTRH7NaIarF8ThTGR2AH9A=; b=X2rt8EIdLTDjfWS+/JTaxf7L3J
	khSAEcv5yuZuKMbes5B3PTjtmVzmgwPg6+i0ayDcT7us8WBOOTSrs+G8qQCLXjTP6tN3zcPWUTkuV
	Yk0/4W4S4VEdk22JeH1xhTFc+/Y2KPzTtCqTnLbmG0xklzeS0XFBWFL2qaS7tEiEBuut0aih8I1GQ
	SWN2B4u8P0XSGJT3omEo9cOYYYN8GEgtbw8U0uzo49+AIXdJfZXn1t4+LU6pUPrQro+iOYWagQNIO
	qG7oFzZ+bJK13P+1xxhjBVHEjO+R7oqOEDx7jE58kKOxagg8oHLhoBUrGuu2liHLhmSaFbHE0v7vi
	xaSI1Nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoXR-0000000CMzS-3T3S;
	Fri, 13 Nov 2026 10:29:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoXQ-0000000CMyr-1TBw;
	Fri, 13 Nov 2026 10:29:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C34B43B93;
	Fri, 13 Nov 2026 10:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970AE1F000C4;
	Fri, 13 Nov 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565784;
	bh=WSY+ANdltmdjp4hZAqbq3uTRH7NaIarF8ThTGR2AH9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3B3iDM/ljx4vAaf5Jrz/ajm1fa4aQGTl0CefZdslx+6VxkuARBxhjYSNmi4qMZFf
	 QkKLtsxQnbE33zPcPAahlPFIGDzefeYPn/GChO8RKvxkqM1+jeJu9Et9Q9cexMlMOi
	 Y2LAHbnJGYXj1OqCp6QwTTvPlu3p/jxUOE88QJniywunLueMhWz0TPZRG1UcPikn9q
	 Z+xuIMcai4dnLzzigGZCK0FpWlTYQWUm+cXDkkL4DMyUKGvMoICIOjVNnNmmPQkisH
	 6coL9DouEs1YexVKGveznBYverqxMXunO/dSm6+PLaJ9QpK4do7tS/Wufkn22KCzxo
	 N3l1ulc/hiATg==
Date: Fri, 13 Nov 2026 11:29:40 +0100
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
Subject: Re: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
Message-ID: <20261113-meek-laughing-orca-ea8a86@quoll>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
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

On Mon, Nov 09, 2026 at 12:33:27AM +0000, Stanislav Aleksandrov wrote:
> Document the Samsung Galaxy XR headset, which is based on the Qualcomm
> Halliday SoC (SXR2250P).
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


