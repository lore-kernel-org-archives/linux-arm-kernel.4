Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F4606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABy0HSFu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a76zrBzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9J9fJaDjY0Dts4Gsqz0quMcF3tDemSYv7SGUwNXF9Fc=; b=ABy0HSFujOUIZMjJsfV0T1RbbC
	mj3YcmJXxW6ZjMMJ00hCclnVC59QmV12XYUC9GOn3Xt9cy4febbGKyViAFFLKM1yyUK9K56VsOXAO
	zMG29C8YFvpL17UUVz87bsT9CX0d5OlVzl0xEohzNchNInGhHiG0BFTR/govOyPk/RQsR9sY6JTf8
	erYoJoipLLzU0egZz2YriZNEFO/9CchED2P5b4I/aWjHJrXHMptcYp2vwKfO+II/DgR28sNooVlr5
	/hHN6dtL3Uj1t1mP0/pN4gHrugb/BjvzsAgeZe/kuqHMibJQoqq6iQLAfuFg2vQO97fHoCEER1ej3
	KHdo1pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSpN-00000003HP1-2Viu;
	Mon, 23 Nov 2026 12:07:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSpM-00000003HOW-1CLU;
	Mon, 23 Nov 2026 12:07:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5773D61418;
	Mon, 23 Nov 2026 12:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EF81F000C4;
	Mon, 23 Nov 2026 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435638;
	bh=9J9fJaDjY0Dts4Gsqz0quMcF3tDemSYv7SGUwNXF9Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a76zrBzxzVcVrcVb6wqriWop3Tks1ZkXJEWtW97ujks72eIwypE0kA8khu3rIUQUm
	 SBXpVyG3dQKRUXSpOVjQ0W5LzdM/kXVLAeqHg8yOvX7Z6M3JbUTRPdypva+/0Iwwwn
	 ek3ZfLn4Oj3of+oTswT0+9gnynzmjzMeZvNy7E7PAv+iv3mJdZGsZna1YULbhhKA40
	 54LlYlecfXdOkq0U9pBXD+litSzI9wpA6eoHF3Mkqii7I3/KjbCz/l0AxN+CYAT3wH
	 1Ja9p4SrK5Utb9EgOW8JfOyCC7XpyGDjizRpeXMHN08Rr5LXARmAN9yi8g9L5LEqbY
	 jBc0ohLZIF6YA==
Date: Mon, 23 Nov 2026 13:07:15 +0100
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
Subject: Re: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Add Halliday
Message-ID: <20261123-thistle-gaur-of-sufficiency-7ced66@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
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

On Mon, Nov 16, 2026 at 09:26:23PM +0000, Stanislav Aleksandrov wrote:
> Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
> compatible with the SM8450 one.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


