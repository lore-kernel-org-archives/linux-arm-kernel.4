Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nz2eLj0a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0vXN2Gm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8CsYdP/wCb7Wii3UCb9oFVMApL91yA2r+Rt4I6PWk/g=; b=nz2eLj0aRVVVmFhNMfKE6YoZPt
	czjS4KO1ZIH6+BSKr4MCyRzV9lTgPOVn7oXOVb/UWFvHnDlSwIvemNJTOc/ql7sy0w9KcOD+3B3Rz
	Xr/ex0XJ6QcXQzoSOwxJFEqEv8yaQdAZbJk8GQ9udaLIkWfbplIQZxesA/8N1FDkiAoWl4w7hKmFD
	NJ6aF1Do6ycFhgby9/KO3d94amLwHMejc3Q7XqXiF+ISvu7HRTvcjuIpdVBT7t1qM0Pq4si6DsPHj
	asUO3PDtYD3/9AHGmS9SwyaR5Tl0Zieuy5UMBfykW89ZM0dEAuxFt3GrSU4Gc+NP5z2EO/3dc7Gja
	2osY58hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRols-0000000CP9T-28PH;
	Fri, 13 Nov 2026 10:44:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRolr-0000000CP9A-1xHs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:44:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F97E6123F;
	Fri, 13 Nov 2026 10:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618461F000C4;
	Fri, 13 Nov 2026 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566678;
	bh=8CsYdP/wCb7Wii3UCb9oFVMApL91yA2r+Rt4I6PWk/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0vXN2GmOOnd+clJilXGVM+5mFYpOeJF1uZYZ/mBnM3QkhP070C3ME28j77VYg1nu
	 XDlgVz+Mk/Owu4XyARo0LRGDrSi9oD/bl1Qv1/VAR4SAuXQSvciXQuUW3dXKqgoKjM
	 JCuq7f1tWIKZ5Sgbchs3NY2vqKdl/8Mg5nIYXZh5NZQB/iqdbuNPoD6FvUpgq82cvn
	 r0eG9X+lhimPYLswzfN+jk70OpWcflbAXc322kiyp33cfA2s2z4GuB7IdGFnST9sJ8
	 Z5nenz04/dPQ2KUrN/J/MhPhV3yfkPi9w3zoYTutZnPfmhe2f5dlbzR8DN5ctCshgt
	 JF/PvfuMvClzQ==
Date: Fri, 13 Nov 2026 11:44:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Clark <jjc@jclark.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Martin Kaistra <martin.kaistra@linutronix.de>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Rahul Sharma <r-sharma3@ti.com>, 
	Robert Nelson <robertcnelson@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chintan Vankar <c-vankar@ti.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
Message-ID: <20261113-ruby-jaybird-from-camelot-1d8272@quoll>
References: <cover.1794284248.git.jjc@jclark.com>
 <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
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

On Tue, Nov 10, 2026 at 11:24:01AM +0700, James Clark wrote:
> Add a compatible for the CFG0 register frame of the Global Timebase
> Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
> cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
> which selects the counter bit that the GTC exports as its push event
> output; the CPTS driver writes to that register to provide hardware
> cross-timestamps.
> 
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


