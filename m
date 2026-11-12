Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C57606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r3Ek6Qez;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdIFbPdo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/sWknFzfkMJCdtQdCu8LZdg8fGGk1yHJo48gozQsrso=; b=r3Ek6Qez1NccYIoq28CNNJvk6S
	QwpcHpC8EG1ya8v5xmihv37+kenM9ZN8JDFrDOXZfC1vdHqF8QdcQRABOQMUwgzqcTkJ8b4pziwPm
	q9g1OnmRJxop3GVFj5iXDLdCUBqB80HHI1h09mL46hoC5lu+jAwnJim5DoYY85rlT4zwM6LDC28JH
	ydmb+sE1Hj63DuxaX2ZZMIinCXQG4tyDu6VZ4ilcoUuqeBnOLxxBLke2LfMrJl92TyfFJd5Sce1pc
	CIbXPukqb5V41AZbVxp7dfPklZzl64c26SkM5Wn42gQHkf12B5PBSpizS86v5seOg2+FGvfHPfV3+
	aTceTzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJGG-00000008J62-3lXl;
	Thu, 12 Nov 2026 01:05:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJGF-00000008J5o-0U2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:05:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FFC460098;
	Thu, 12 Nov 2026 01:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B297F1F00A05;
	Thu, 12 Nov 2026 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445554;
	bh=/sWknFzfkMJCdtQdCu8LZdg8fGGk1yHJo48gozQsrso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PdIFbPdoz9GfgBcwbEO6KMOrWh8knP51XkN0XpNrfpXqoQuZEHesZmKpqQ/vS90TQ
	 TEt/QHibTiRztdr7fqM6giXyEqUVmRNvmqSqG9kcuILRUQ3MYc32ey+OSK2dfG00Xe
	 apxPjIMeSBxIgi30plBUeaeFgY+1yBWzlBVSiiKDgE191ofWpSklbF4j/VoC9C3tj6
	 1bsVFSB8xgwt6dlp4UKQE1r934cJmvM+Q3MEjTMba7+xTJejpChXIRP9bdfzBipk/v
	 41AHUHvKOKg7C2ZXcZ/ShoxOwsELLv6+rEp2ZeU77pgHwKaaxmHfMesuDNyi+bNE0F
	 Tou/U3CLPHT6g==
Date: Wed, 11 Nov 2026 19:05:51 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Message-ID: <20261112010551.GA3769976-robh@kernel.org>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
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

On Wed, Nov 11, 2026 at 05:12:45PM +0100, Robert Marko wrote:
> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> - New patch: require at least one pulse per revolution in fan-common.
> 
>  Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

