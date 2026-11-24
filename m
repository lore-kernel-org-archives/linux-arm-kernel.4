Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B739606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tekVjcX3;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=XbypoaSb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BUOM/pw3EPem2znFd85kknUWld1XRJydYwICtGMnpY8=; b=tekVjcX3iFPfCjHV8dMpkmOepf
	JvJT0jDz3lEypjDKlCLtkPfYfl6l21jRNWgaKZVJubWNxUOy15ox84pzh4viumgnpWu8WkmCB+DJS
	UAM6D3TqEGVDuMs4RWSo777/Z8ch16KnKzWYGcSzlmHscYrKv4ROVpBb11cY5gajBjAO0FM/q+B/V
	kIzeOl9yd7iFW9rc189yRdp5QP1MnInKcgu9V+OO12wP2rNAxFWc9NhkLzKWM6qFIAKEXbBq4oDXv
	CcPbDJA0s+fNfFwGWT74YNCMv5K0gW4NrGdnFA8wkviR2fy5n3e43H0zJqC1x5DNk97+D4Tkjqf4z
	nqXbCYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwrK-00000007hkH-1O55;
	Tue, 24 Nov 2026 20:11:22 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwrF-00000007hjk-3Xh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:11:20 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 649BC1FB70;
	Tue, 24 Nov 2026 21:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795551075;
	bh=BUOM/pw3EPem2znFd85kknUWld1XRJydYwICtGMnpY8=; h=From:To:Subject;
	b=XbypoaSb3rZ8QDSvopbLldDok1saNhtoQUuNEoy+DZ5zWVbRU/OerIecVBfXjCbeo
	 MP/w7okOc3p+Hky5VLK8AWBWB6U7mGvpVEckwVgjJPWsfstqXa5aEQfPCA68F/nMrw
	 RwZtd5LZvKYNbLAMkFrDUnGUyWFaXsY97UCOqADhtIl3a0Jw3KdhEDX8ud7lutppcn
	 vLs7s//I4BiynvdEeriU7F7nzLUEQE4s4NEvBc3rDgZIKFUy/va+c7KHXhMSQHQkZ3
	 Av3eXAx9H7RJrz0IE1WkvB5wKvdsoSHEuoWfLUK32Eno6VcEBNJQ+33PP2Xhd4zR1M
	 flv2RIwwqef0Q==
Date: Tue, 24 Nov 2026 21:11:10 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
Message-ID: <20261124201110.GA366860@francesco-nb>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_121118_942433_9FF5DA4F 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Frank (both),

On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
> Add dsi node to the i.MX93 for support with mipi dsi panels.
> 
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>

I am not sure if the other patches of the series are ready to be merged
or not, but this seems a patch we should merge in any case so that we
enable other users of the DSI interface of the imx93.

What do you think? What's the plan for this series?

(yes, I could test and review it to help, I know :-)

Francesco


