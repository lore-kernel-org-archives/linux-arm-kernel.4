Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5140606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Un/Gwk1p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDYJnLDS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vewfa4e2I0aobL3WDU7H9NeMGakdHt+iIIc9ifO0nVc=; b=Un/Gwk1p5pv41LahKsopOh8FmD
	Fz8kZk2+3T0fZaWtP8paglQK4V5PuwJINKu4vtW7wXw65X7EjdkBNcFdgLfny09vpMSWM4PH7X6Cn
	tJqzoCkWTpiiiYHH4HqFXk84i2gijJJ3zXwMBCjvtiTHv4NQ8hBQiY8Ac/llvMkFE3jhdX0oNQQ/i
	/IjY5MMO2BGVnrP0bnKWMdCEqfqQ4jtfdN99rWaZrDm0tyMyDZ52zwMQEZ31NAA27iLN2SYCcCy0u
	pCwJUwU3C2wfpQ8YzBJ0QWsI5WrYUNk+adiMeBLmOdq+0lXyRhmicc559rNX8oQvpEVxO+X18UEKc
	1NbHRU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6K2-00000006SWB-3Vvo;
	Wed, 11 Nov 2026 11:16:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6K1-00000006SVi-0KXm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:16:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6079D618A8;
	Wed, 11 Nov 2026 11:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195EE1F00A05;
	Wed, 11 Nov 2026 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395816;
	bh=vewfa4e2I0aobL3WDU7H9NeMGakdHt+iIIc9ifO0nVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dDYJnLDSCDAN6OmtCeQriuUg1rtkoGN+AAAKEo2iPlMZ23kTyopDsWA7VhxbudFYa
	 Nkv8/Oi7b3lpLzL3BwjtTavYN/TtN9FLcrayBj8+FEWESmvmGYlx4LoCqAs3rIEFBo
	 NgD8Yq/hs0r3vqLO76rhu8xA23suPqJ+E20VtyVUvKYEYfJc+4l3mGpApr9+8XvEHH
	 44B5WZFJETrOXatoyrOirm6f+rUwkzHloU3bZib2iz695siHmimZgCNu3I5UIcXk+3
	 w53nVdESs/SnF7hJC0BXz1fcXRORmyc+0N2jkmP435Z0+21WZ8VpWniXCpl4x72i5r
	 eOtiRecZlMgVA==
Date: Wed, 11 Nov 2026 12:16:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, robh@kernel.org, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	klightspeed@killerwolves.net, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: kirkwood: Remove duplicate DS212
 compatible
Message-ID: <20261111-versed-uppish-butterfly-fe4c3d@quoll>
References: <20261110093120.179318-1-artem122novak@gmail.com>
 <20261110093120.179318-3-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110093120.179318-3-artem122novak@gmail.com>
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

On Tue, Nov 10, 2026 at 03:31:20AM -0600, Artem Novak wrote:
> The Synology DS212 Device Tree lists "synology,ds212pv10"
> twice in its compatible property.
> 
> Remove the duplicate so that the compatible sequence
> contains only unique identifiers.
> 
> The compatible ordering is otherwise unchanged.
> 
> Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS devices")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


