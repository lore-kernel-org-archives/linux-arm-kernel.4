Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94006072656
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hvm/gnE9;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Fw8kpcc3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Xt+00HyDSv8lfLDiJMZJ5tz6uCFKhBO+O40JYLBMWQ=; b=Hvm/gnE995iCeBo3j9gK6v2Rnd
	3XnS36NC1XJJXhiGLXgWVRK7i0DS5MBl+iqcatnTq8jpwjWWMbjecpK7HAwZlTM66Qi419H5tS9Ju
	EhBvGRBgZ2fyDOKNv9D2ecmRV7PBhiYRBGAEztxofAX6dAJZz9aPRpB0HEyLjVlFNU9i5CCtcJasg
	WHgKb+i5dy51n/AXoAdJyNNwuCnLxu2rddYj9hvZW5/+myUx4zDZe2a9poHUHjKdEI3rrdaDXt1Jv
	sm977oIgYcQbC+TzIv3gTGKqNPWgbPuPnL3gT5Lyt73uhD9/OXOXjU9MR6T0u1lLnKVt1pwCAhbj1
	4+knn7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiKk-00000003JA5-1yJP;
	Tue, 10 Nov 2026 09:40:06 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiKg-00000003J6J-1YIQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:40:05 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id DCB0B1F95E;
	Tue, 10 Nov 2026 10:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794303598;
	bh=+Xt+00HyDSv8lfLDiJMZJ5tz6uCFKhBO+O40JYLBMWQ=; h=From:To:Subject;
	b=Fw8kpcc3XmOIRHdtW8NnUakw65Bkjhu+jVrQIWqOdFl0d29N8bgJ06Scm/I7bY6t6
	 xPyvtuvJsHmgt2bViYIg04BxNryQH9rdlwx+1Gz+XVHY+NJsJniC/6p6yJxFKyGdlA
	 sPh4AB2028tzkTcLQDrihIQng02DwbxfkSMed6hMUdgKoPAUg+zb83nmQjFsTHXlc5
	 v9dROSzWIz/pL52XnPxmBHqBEd13CeqfV4fy9CjFHsm7I6CGj2smSIql7OgnQNEj3d
	 YR4Ss/EML5b/XUc3BkidpZoIfT9FvG0EqtFztE70iSVWNzfupUVmZSmVPyChZqwLYN
	 8XqAiJrlUbAng==
Date: Tue, 10 Nov 2026 10:39:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640
 camera overlays
Message-ID: <20261110093954.GA129290@francesco-nb>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014003_474633_677F5576 
X-CRM114-Status: GOOD (  10.87  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello all,

On Thu, Oct 22, 2026 at 04:31:24PM +0200, Ernest Van Hoecke wrote:
> Following feedback on the Verdin iMX8M Mini series, introduce a binding
> for the connector's sideband GPIO nexus. Add connector mappings to the
> carrier descriptions and stable labels for the SoM-specific CSI media
> nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
> and all three carrier boards.
> 
> The binding intentionally covers only the connector's GPIO signals.
> MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
> existing bindings and are connected through stable labels in the Verdin
> device trees.

We have now an official page documenting this connector

Link: https://developer.toradex.com/hardware/hardware-resources/peripherals/toradex-camera-connector/

Ernest: if there is a new patch series, I would mention it.
Kieran: the danger note in the page is for you ;-)

Francesco


