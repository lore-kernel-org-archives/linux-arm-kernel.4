Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DF606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kAB/crXr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOvO45kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H3tlyIivpEQAfTuEdh9TMux42zaoavdQDwL403yp9Q8=; b=kAB/crXrSR6TmoB+kwXPMHHMyY
	jFbASxAl44qMJuDhBmdA8QX7WIF7xIRK0u+ia7r0ifeibsPpo9fJZtmGO4zYXOOV6eLWotYFzHg6p
	Ks/+n1csiIaju6W+RSKpZnVHtpidaJHmySKlvlIRZVk6gG8UAhFFKmLFMeopijZ8+GSeVmtYq8OPz
	cVzMnGalwgjuFBUqxDC7Azkr9fHCuV8bH0qOisPNnhh0eUWaowPXRkc/aSHJ1eMfpwjxEkUQHqnqW
	qJ96JnAM6jyGCiTgbwsxYarUfXElGg8Auuv01Npl532fSfP85qVU7n3fbILWTz6ReC4Fph+dz3WcF
	eOt3vjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj7P-00000003Si7-0arN;
	Tue, 10 Nov 2026 10:30:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj7N-00000003Shh-42x2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D952634FB;
	Tue, 10 Nov 2026 10:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EA21F008A5;
	Tue, 10 Nov 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794306620;
	bh=H3tlyIivpEQAfTuEdh9TMux42zaoavdQDwL403yp9Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOvO45kq67rd3N7RAEDn0rC+QwfiY/USWlX/UZJCTCLnP2Um7V6kANrHdVR+KIwNr
	 5wU/wTnVdN3rl9/vq9DHVgOkjpgz/24pCLMUXojYIBnczHxC6ValM4n1+RiGuD9Jnz
	 uyk2i1s8XKF1u/Kh0gLvzRa4NIaczzb7mpHRTeYIVMKcGA4c7rU7AibN/8BNLCPX+F
	 wVO/nV+kvk5781/R3Q9m+7Ft6Nh76BMkr3mfFbu7zIkQ2+1qPg/vTdalwC5mPMaDNM
	 Zj6JPxrXao9l+JBA4Gz/EyRlchhEq54f2WAN460YKlU8/AfJ4yWTiq/nsbv2dHmHTN
	 ohOVYCvzuoBuw==
Date: Tue, 10 Nov 2026 11:30:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/5] dt-bindings: net: dp83867: Add
 ti,output-impedance-ohms
Message-ID: <20261110-polite-juicy-labradoodle-a939fc@quoll>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
 <20261106-v7-2-topic-dp83867-v3-4-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-4-45e1d3adf1bf@pengutronix.de>
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

On Fri, Nov 06, 2026 at 08:47:28AM +0100, Steffen Trumtrar wrote:
> Currently, the output-impedance can only be set to default, minimum or
> maximum or via a nvmem cell.
> In cases where there is no backend for a nvmem cell, a value can not be
> set.
> 
> Add a DT binding, 'ti,output-impedance-ohms', for specifying the
> output-impedance in ohms, between 35 and 70. Like the existing
> properties, it is mutually exclusive with the nvmem cell and with
> ti,{min,max}-output-impedance.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


