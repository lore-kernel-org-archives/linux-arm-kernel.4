Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6460A2617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GcRbgopw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ecQBSyIc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p0RK+IYs95gpjlIxIoHnheOHHg7wwsNB1dTa28TgEXc=; b=GcRbgopwQwksEXoOYaLEUM2gQ5
	8KVlZgaTmlUed1rqlyL4ybdlg3ToL1YGvRLX9QbHKHZqRGPZfBHkkXgz762scTy3+gQUDa8wYqfZH
	miAl4FcmXIQH3YJ5M2yyVDm+LuRIbuEtif/+Fhwx53FqgCsrmvvuYrcQzTcOrJoRo4vSuaqvaGEqx
	/qQ4wCJw0w2FXN6ZcpJqCU2Qfbr+A5+O/L8+HJGS8OTSaRequF8dniVN1vYUOlZO4VOodiHZN7h/W
	HSr9Ie7OxAl6mFS6ukdve3ln1NQjZri3cQZrXn/8vaiYUHiZiIKmf5Npmz05QNu+BrZw0pYt9Iqco
	TNPVOQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFn-0000000CJTk-1egX;
	Fri, 13 Nov 2026 10:11:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFl-0000000CJTF-41TD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:11:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A3C762670;
	Fri, 13 Nov 2026 10:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE511F000D1;
	Fri, 13 Nov 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564689;
	bh=p0RK+IYs95gpjlIxIoHnheOHHg7wwsNB1dTa28TgEXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ecQBSyIcUWIq1+AWi2yVWcEaum5gQsY4wqBCQJNmf2nSsfSfiUTSAji189zo/un0k
	 FRoZe9PFSTS4Gm1ODTUjdbDkEBL6mqmqzg2zy3fSxbHb1v0BqSsA97R8lo/MSzscjG
	 MWFfHVTz3RlD7mcysOgD35o3AQUaBn95grYCX4/IbSLsq/6VRLvlqatU67KUb0iBQf
	 3vPsX66g5jzFc33uti9t38WLAHw2qmUTAszc05g0rZ73YNuwabC77O7bHc347ZPh3D
	 QJeLnJueodozV+4+QFX7qGTRxN8MuhY82jfig6OZC8u7FscGbLdiAf9Ao4UD3GYaKm
	 4zcbAcGQik7Hw==
Date: Fri, 13 Nov 2026 11:11:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add an entry for Cloos
 CBASE board
Message-ID: <20261113-inscrutable-dancing-python-bfbcbd@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>
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

On Thu, Nov 12, 2026 at 05:37:01PM +0100, Lukasz Majewski wrote:
> Add an entry for the i.MX8MM Cloos CBASE board.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Place cbase in the correct order
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


