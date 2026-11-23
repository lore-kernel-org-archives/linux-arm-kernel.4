Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0520606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DU06tbLx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhSYPe9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0aJ5NufMkA0oD7AZywus5LCK/c7Fmr+e+ufWOzcP874=; b=DU06tbLxpUstSG
	wK2cJehwkQzTU5vwXRhvG5UXkG6KSX7cl/EJv4+isdyNqyTHuJ9ItzAM6shPV5uhvQTZ3RkNf5Dbe
	c7WY0XT1XVsgXW3oItnim4w0essbEz5CNbbEBmDJd4AUnDHSbtFhTJwpDdbmCcYgvR/IhHMpveFlL
	IVLBzST/cDc+tSy194gDoFn/KOefdpbSj4yRqWrJmep1jLqzWFuYiTz7qh9xWmdISMZb4Tbmj4Fyn
	yx35J3+99BqhemRqsY9B/zhiTVTU+va/2Jz9e25cJ011EGP+8CZe6FlnojdvATuU/40NFxjLIf7sb
	V9l+7X1d1JBfDLCO6mHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWYc-0000000481v-3TpP;
	Mon, 23 Nov 2026 16:06:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWYc-0000000481f-0dYp;
	Mon, 23 Nov 2026 16:06:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2EC5439EE;
	Mon, 23 Nov 2026 16:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8AB1F000C6;
	Mon, 23 Nov 2026 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449977;
	bh=0aJ5NufMkA0oD7AZywus5LCK/c7Fmr+e+ufWOzcP874=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NhSYPe9lfkgnjIr0bn0lVFAu74Gql+ImttqV88SSuZvfqujeqgyPWhfkEFENt/3r1
	 ljaq1vYZcEqdY0QaOOL0xJ4faDwMsTQWFhuc/DLEh7F5S53TUi76y7pRy5/2KBJ/Do
	 R/AaittP7TCCqVaLAbG5/xg6ENb9TGCtEL+H/GAXsuuZOXoKaJz8LwIN0Ih2Sz6fQq
	 SG7WQ/80to5vqtqJf8jhdVTBv1i7WdongDEm5KiOJKob1tyqgknECSUJa6CRaEcXdy
	 YQjXCHSPa4xaMWqbotNc8S9Xm+c8go1+kbdWfwbW/aLlsp9GODhkQTb7wDZfjNFCul
	 ywN2gZCgmj4mw==
From: Vinod Koul <vkoul@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
Subject: Re: [PATCH v13 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-Id: <179544997369.275844.18034015183144679963.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:13 +0530
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


On Wed, 07 Oct 2026 00:28:04 +0800, Coia Prant wrote:
> Changes since v12:
> 
> - Only write pipe_sgmii_mac_sel when the property is present, leaving the
>   routing unchanged otherwise (Shawn).
> - Validate the value in the driver and reject anything other than 0 or 1
>   (Shawn).
> - Drop "default: 1" from the binding; the property is tri-state, so no
>   'default' in the schema is appropriate (Rob).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
      commit: 0451ac710ad1627f48116204f6fcf3aec72cc87b
[2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
      commit: 7827b62741ea75d24b3db1ad01d09b6d15423a62

Best regards,
-- 
~Vinod



