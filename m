Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E5606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pC+iqR3t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVLU3fxs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fXi/ODkkDcS7yB3qAtaA6Va6+pHO+yh02Tn0NReGjdg=; b=pC+iqR3tcPIynp
	flKhhrcPP+0bcWW6ZtAkVH1AbGh8L1i7R2Kl3ucjn3Djo6VKNjNjEVRCzq+4pINzkjYgaiPx9jy9Y
	ohu6BbbgId0FpJOv+E7YYbvkvutKGhT0mNzfSaYLUbJkv8O7v235J9yf1M5ks4sNtms6/4FjU1yuS
	yWgxuhT0OVHqQAbE2m17jWNZdE3YyVteRVeHPMpGd+om5L/MRkIDrVuGqZKQCZbCgb2bfFEK44Nh1
	An5WROmTx7yED7mvork2htxDWLoWtiU69BAJH+G1gRzGyRVv9vFYyYmsgn8PRn724AB/dqiSqWFgT
	TJFH9Cgxni67TSrl46NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFDK-0000000ARMM-3sHR;
	Wed, 25 Nov 2026 15:47:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFDJ-0000000ARM7-2H1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC43C60D0B;
	Wed, 25 Nov 2026 15:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABD31F000CF;
	Wed, 25 Nov 2026 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621636;
	bh=fXi/ODkkDcS7yB3qAtaA6Va6+pHO+yh02Tn0NReGjdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AVLU3fxs7ziGskU4JNYWdlQtxTmX128cAa6+2hAlx4TdKTG6DpejbExUU/e/f/mKl
	 c56wa48HrXsN1eBo78dwYI2aG/X/gryyefEWRFNhtrdKFewwrR9RqOrsPxY6uaR25H
	 cJS/h2bkpoI1npa6t1zhZ6F/gqgcdbZhrrjyKd98lUgxpUEFgUWYlXKFYP+/9DVvfZ
	 5fjWH3zBTer+CfZcpxFKJai2JGnZUeGQJ9hgFV1RvQAq2VJ9rgR/Yt47mZ8rXmp7sC
	 s+1BpjyNR1g8Q7mVlMkgSmQq5DrE9oCEDcQv2uvYEKkD7CqK/28gTJQsF1eYJB3d0E
	 rnWIb3oAb/gqA==
Message-ID: <758f7d59-21fb-4441-977b-1ad90e227441@kernel.org>
Date: Wed, 25 Nov 2026 16:47:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Janne Grunau <j@jannau.net>,
 Peter Griffin <peter.griffin@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Neal Gompa
 <neal@gompa.dev>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Fabio Estevam <festevam@gmail.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 24.11.26 23:59, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
> 
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---

Acked-by: Sven Peter <sven@kernel.org>


Sven



