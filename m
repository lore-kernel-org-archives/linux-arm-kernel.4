Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vki7SFyQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQ0PGikm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FrsA9VM2RRDYw3dIWHPlcPU2Tzr0ACPscINTsZ3wYKU=; b=Vki7SFyQWGa6KAOUpLwzAjddvV
	C2vCkBNPZ2pehDzL+x7ZfeIF3rgUP2U8P9qnciMXv3aw+qpAf5criZMd5Ceo7GYJXWtStV3YUC6+r
	0/rI/TkDQmlxxpJ+rAh3rl5tpubyZBBJsSswXb996w5SIo3YuKDEB19Xo8acBRUCs4x3r6tcAdoBa
	jdgJLZxKlEfx9ePniwtEtdlEtaChXbAjHBj/k1GOcZkQMafaZ3gb95Ei3PnSeLb33eKswog1eoGag
	dPl/fYwoOFuvhY1rne/HVjB2EqLLvvlIdhvWrYH/+ipxUgkLyRBtRsVhYTMwS9jC0B7SSvYyNVFfN
	c7sileuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPNk-0000000Bv3g-3N2v;
	Thu, 26 Nov 2026 02:38:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPNj-0000000Bv3V-10md;
	Thu, 26 Nov 2026 02:38:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F1E76022F;
	Thu, 26 Nov 2026 02:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E091F000C4;
	Thu, 26 Nov 2026 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660721;
	bh=FrsA9VM2RRDYw3dIWHPlcPU2Tzr0ACPscINTsZ3wYKU=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=bQ0PGikmMVpCXzr2+ogQGCzmWiJsDojV8YuLw94SOoEP+6af4SDkg1Hz05ayFBKaU
	 T2Kkn6ace5P/sBOVer3k6SEGH0Ev/B4bIxNUbkMzLaVWTX2m84EjwxigZ9zr7C5ta3
	 Io/6ySL6xk7/Wb0+RLCQabC0jimBgxFCnQtIxULviz7f7YZ0WX+nGUMUl+NqjmIh09
	 S4gN31qaEurmnHa5pYbcSItay35YwpXukelvdSK/KB8u3jxbJ51CUjMQpidqSu7hwC
	 vP12nZVTa+DWYWW3MwC5TGg10y40os0eK+YRpCmXvbizboj6O+CuHCfcEKzmPUCQZF
	 gIUMuxcOfUvVg==
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Abel Vesa <abelvesa@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Robert Marko <robimarko@gmail.com>,  Guru
 Das Srinagesh <linux@gurudas.dev>,  Thomas Gleixner <tglx@kernel.org>,
  Radu Rendec <radu@rendec.net>,  Will Deacon <will@kernel.org>,  Robin
 Murphy <robin.murphy@arm.com>,  "Joerg Roedel (AMD)" <joro@8bytes.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Wesley Cheng
 <wesley.cheng@oss.qualcomm.com>,  Vinod Koul <vkoul@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Manivannan Sadhasivam
 <mani@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,  Bart Van
 Assche <bvanassche@acm.org>,  Bean Huo <beanhuo@micron.com>,  Stanley Jhu
 <stanleyjhu@google.com>,  Herbert Xu <herbert@gondor.apana.org.au>,
  "David S. Miller" <davem@davemloft.net>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,  Viresh Kumar <viresh.kumar@linaro.org>,  Amit
 Kucheria <amitk@kernel.org>,  Thara Gopinath <thara.gopinath@gmail.com>,
  Daniel Lezcano <daniel.lezcano@kernel.org>,  Zhang Rui
 <rui.zhang@intel.com>,  Lukasz Luba <lukasz.luba@arm.com>,  Georgi Djakov
 <djakov@kernel.org>,  Sibi Sankar <sibi.sankar@oss.qualcomm.com>,  Ulf
 Hansson <ulfh@kernel.org>,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  iommu@lists.linux.dev,
  linux-usb@vger.kernel.org,  linux-phy@lists.infradead.org,
  linux-scsi@vger.kernel.org,  linux-crypto@vger.kernel.org,
  linux-pm@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/14] dt-bindings: ufs: qcom,sc7180-ufshc: Add
 Halliday UFS
From: "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
Message-ID: <yq1tsl4jp07.fsf@mail.kernel.org>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
	<20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
Date: Wed, 25 Nov 2026 21:38:40 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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


Stanislav,

> Document the UFS host controller on the Qualcomm Halliday SoC.

Applied to 7.5/scsi-staging, thanks!

-- 
Martin K. Petersen

