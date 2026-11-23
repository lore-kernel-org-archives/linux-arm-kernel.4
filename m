Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AB606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wneZNH7O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSIYT+gE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aKQbuNwFr/Nx8wYobxXg0xTCe3AGkTE27xzzOZwvQns=; b=wneZNH7OlPWG/I
	EcEAnBWFTt0Spu/NAxXW2LOHhPdQ2wJnN0C9RX/8Ri3MkvcMSOvHyq8j9JoqtV9u3kLXJwTApiDf0
	MjFBYvpcZE+JqDEzIFl6WSNIDz7AQBnB469vIjqKEJQ+iq5cROXk1L76xogwa9HDI6+DRW9YlzTVo
	KaRjV14sRI2YduwCG8psKlUjD0lyepExCw0N3lq0znyqa3meggRUCmEal29t9U0FYRLoqnECCPg7K
	pyE/7QEQleuHDW4+AdazDhinQNqNX9ZoPmrdG97Z3abfLW97/J3uhzS9cu/yWFxn1Tonky9kDnTbi
	mM3otRI5b4sgtKFb+d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWYl-0000000485d-04Fy;
	Mon, 23 Nov 2026 16:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWYg-0000000483t-1Xiq;
	Mon, 23 Nov 2026 16:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 599EF4421D;
	Mon, 23 Nov 2026 16:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321BB1F000CF;
	Mon, 23 Nov 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449981;
	bh=aKQbuNwFr/Nx8wYobxXg0xTCe3AGkTE27xzzOZwvQns=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=WSIYT+gEKpICbw3GpJkX6XyH75SqxoAe5i0bgAzQXRBOCGuLUF7s45+CexEyKh/sk
	 j0drR9z9Y+kXVhQPZSK8BawDKGyuPmJJTkt35kqKmx0++A2xfcMQAwR4PdS32rTslX
	 cmiIwmmJ0wgScyLFsF4n5v1UnFc7XvW8KTbGgc3oqCgJnAuhZpmR/ykNM+vG1pKx1H
	 4vGZ46QYKXcNb64q+29MBHzm971Jd6yImTij6G/ppndpM9hLkdAjnTzo63ilZtSiQE
	 ybAI3+OzJSZSv3kqnO7h8qBHH7qA235LlZgoZ0030udPsHVZvzpe6dUmh3Zs+V50uz
	 AzqKuLhtuLE/w==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v15 0/3] airoha: an7581: USB support
Message-Id: <179544997784.275844.2168533333903460863.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:17 +0530
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


On Tue, 03 Nov 2026 20:44:05 +0100, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
      commit: b5e699a21adf36206a826089b8e8011c6051a716
[2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
      commit: 27f22b201fe3c313e88b2256646b2513ab22e0b2
[3/3] phy: airoha: Add support for Airoha AN7581 USB PHY
      commit: 7c6c29cea0ef6b810424381277bbdf1a98c31b8b

Best regards,
-- 
~Vinod



