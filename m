Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwUrBw2V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHOIVamz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/oEd/Rx7z61vzKiE7TrZNxTBqcUG5YHAydriCm6gOsA=; b=KwUrBw2VRGVKE9
	7L1XRZRPtCJv0Nlot2N3TEmIrnI3FjZr3mkpVOCZ2+0MQ9ZuU/eL0Ek3tsBdXowSJShn8116uK659
	tf/snVUbV/z7JJlP6Xxzk8yqc3KDMeVB0HWjB9auL1fpsLOcaMsTDapLRJc84qQ8Uw2DntOa/nTC4
	ngI8WR3BnN8TUqzsNYPs7m3QaU98Bpf5Wibm7we+BL9ud7xdt+cUE2zQUHibSTM8vIBBtFOZuVbBb
	2aZm/BKpW+GAVvroBAhhvzLSvKz90rsjS4i/Z89JGBvAX5O+sbxkG/QIR0VMSW7ggIxt7fAtCJJ9E
	U27D0Ranrefp+hhRzQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxt-00000009i1j-3gO9;
	Thu, 12 Nov 2026 11:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxQ-00000009hNm-0YzM;
	Thu, 12 Nov 2026 11:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69ED644591;
	Thu, 12 Nov 2026 11:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C691F00A05;
	Thu, 12 Nov 2026 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482827;
	bh=/oEd/Rx7z61vzKiE7TrZNxTBqcUG5YHAydriCm6gOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lHOIVamzl2HbE2kYl6t1Hi/fSLUIo5a5kdanxjhNZXwjar2Q3xFo7LP69tPoT8FoD
	 j3Y3zsgNV1Jrkd7xcKNNC6Vfkn0Z29wjdb5h9pWjXgfitk6gJN8htyOqX1zzwLe+/J
	 wuosM1b5oWfzkAUTuE1V6kVtPrCwuQBQ13KgRfWML/k7R5dVS3We3zNdiG0T8g79yr
	 OPYcLErMrgOspm9X5kpCjyRxXvaRlc6nQDmtfSgFnKEp7KQdSMuXRLjORLaDscXkBc
	 1jOye5p9Bi+6AkJ+pQkHJCGING5VpDMNYsGIO3YysGk5RHxqYg+acjTmdQm+x7dwD8
	 TuBDhhUIRDN7Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
References: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Message-Id: <179448282346.507383.17246536028374736454.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:57:03 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 14:27:51 +0200, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
> 
> 

Applied, thanks!

[1/1] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
      commit: 518d5bc7a636696969e3f4a7f9c66483e4f35e1e

Best regards,
-- 
~Vinod



