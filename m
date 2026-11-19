Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5657606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5KNLbrz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rrWTKlh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=; b=D5KNLbrzjZnziqn8ZUbKxsM8mc
	0pZvjGOlTy9PUblC4pOOHXiDLMPXFAVtU/w9QnT8dQlJziKEwPCuJevVBmpZuFJQ/5qm1kw/qIQA0
	iLWA8uzm8OC+JFNBrQr6AwSHmkUBBhgIJ9NKt1KBoq4tWyPN1bYTzSFlIlaqcp6Zj8sG02WQpBSQA
	7rnYkKnAhNxL5UD8q3eIJDRXRSlsT5eYNtHqsliLAwI9lXkAKulNUEpbXSauW4aFWTIMoQOfOxwy0
	5NkDESxy6jQFOEwrCxx2AdPkO9K067DSaSXp413mFLkm9Mmix9FkJEe90r8rkXnHPX8dJowFsxCWY
	0x0Aolig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyuX-0000000BT0a-0YWf;
	Thu, 19 Nov 2026 09:58:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyuT-0000000BSyw-3Gs9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:58:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso15406165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082307; x=1795687107; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=0rrWTKlh9eu6cz2VCETO7+15/PeAFvo5ayE1QgBi3XZqqKIBlIUDbjZDoQ6qjTfmIg
         YbUy9Wo1DxFMvXxHPsyXeosISxg2tKzs8/A5XjQM+WYTq6BAqT74dEwt0DS8E0iOU2c+
         MxIDHJnEFzNPLBf+HGMYfUocTSmdmSFsNU4ZTjR89+2B92D/laVK1B1JeQ5NuXlsRKW7
         8gOQ18UbDCV9pDH25KBMnIGKM+lCmfmP3afTOByBJKS4OMi6lBqIDmGTTgo7iMnd/yzc
         DfTXFdGKAqhqBL2x3bLSQvNDgTW7HjMB3Z/g9bzaNYyK0bRO0TLjwDA6eOp4vkAFzImn
         EmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082307; x=1795687107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=p8+Jn3YB4tvLLumOme1+21G2IOxT1PsYg+DMjKfevua62xnUjjcCnX2xC16Ik9wjob
         z8xQLvNGqZz0fhoM6+YAAtBppkcB9YgDtDV2ogNq2v15AFKT/jaY1F5HQr7emQp+Hanc
         +bJmlyQFYmzel5rVd+CFBmfVO5P2ADjCKfrgh186CLLbRLWCQWmakKZ1mdKKgX4aa6gr
         /e4s+xYxTOBLZC+QaoU3AotjoHNjJ3mPHUwi3GMgv1IGa0zIVmU/JJ8A++KAL2rFida0
         bg6At18wS0uL7zaVfRIM+R7hPv68dL28YYL2vp/U6edYO/VCXzYEfJjs3NpoUKyiDJ8w
         VTTA==
X-Forwarded-Encrypted: i=1; AL+hErGOLHiPIy7gspnGIEc6PCkYOxuUF28fsvPeXsgzvPuunKmP31lWRe5os5GK+kBAsjpcCBKnp0rr60lSkuDZww8v@lists.infradead.org
X-Gm-Message-State: APuU4Z+YcmZjogmI8ui1S0DBdZzdpiihQq2+ubFL8gBqHGHR8rsdVveW
	RXkPcSyhB9/7P6PmqjG0Vk3of4u+2p5vguTv4cAa7Eb+p1e7DJygX+Sx
X-Gm-Gg: AYBFou2Viuy6j1rvOKCuQZM6AgREqi2Hoi/9rSmpTgoBa+QBocfFSgPaUg0wbRNgPBg
	Vd8hpZqNMDMERgzKqy9xuV47oKgiKWNipyUHU2wkKIFOK7yHxj3CbB1aYvxZrDUt3sSqUQXm5yo
	6hgwvJcC6rMkEtoijuXY4uMa7piA1CRXl6d3McDnU22u0wxNSv/dHjYEv046TzD2OatSTnlQ0T8
	6rzdav/6EKxw5wIwErN/DbhYrCH+QH7eii9G7zlbOxb+X8NIkDSxDhk4BWhJr9rpXnUDVwmKVVb
	1NfGeejl84X5ZrKZERkpguWmqirSeDoZDFgh4vPKNPKUQXV7Wx6TbTBL8lfeizTFwL2Fw1EOCLa
	huhOXkiTIbPdPXHW7nRA5BAYxq31iG4leu2TSwv/gJrG9jc8X42WVOgitJ+knR+2LUHi086P2xs
	uciwxxiG8L0HFGrlb1EuT+htvGSsaK1RRfm8GjxrUEYPi9LPB+Ll+TFITZjCZivPdaiPG+woBbs
	BszH3nuhsiksJUH7AxnkbTLUGirdPOS6xo3d5g2RWqJs6KDmTHXrMAy9o5jUZF75N3GzPD5pVnN
	cbm69F5g2IBGGfb9uJIsZhoKInNuBTWpWWqSJVbKEVxHGp+NlFKACQVqfFcHn+TOviOQ6JvI3N7
	x7nXVGcpEW0NiapyAEvHSz+xs+QnP9kpNpxl395lH2iOce8kxLY2pHWj7Yb+miQ==
X-Received: by 2002:a05:600c:3e0c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb7da458eemr109808135e9.28.1795082307133;
        Thu, 19 Nov 2026 01:58:27 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b1ddsm9462578f8f.28.2026.11.19.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:58:26 -0800 (PST)
Date: Thu, 19 Nov 2026 10:58:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7IP7M_UAtYFm4D@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
 <av7BStmo7w4_rPci@Lord-Beerus.station>
 <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015829_848037_1E6705B4 
X-CRM114-Status: GOOD (  24.47  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 11:42:54AM +0200, Daniel Baluta wrote:
> On 11/19/26 11:28, Stefano Radaelli wrote:
> > On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> >>
> >> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> >> on the Application processor because they are used by the M33 FW.
> >>
> >> Also, instead of disable in the commit message I think it is better to say "reserve".
> >>
> > 
> > Hi Daniel,
> > 
> > That makes sense, thank you for your review!
> > 
> > I'll use "reserved" for the peripherals used directly by the Cortex-M
> > firmware, and keep "disabled" for devices that become unavailable as a
> > consequence.
> > For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
> > for the M33.
> > 
> > Does that match what you had in mind?
> Yes, that make sense. I wonder if it is a good idea to split this patch
> into multiple patches each one representing a logical change.
> 
> The commit message suggests a lot of activities going on with the code which
> makes it harder to understand. Either approach is fine tough, as the changes are not that big.

Thanks for the suggestion. I'll split this into two patches for v3:

- Extract the existing M33 configuration into a common include,
  preserving the current behavior.
- Add the M33 overlays and combined DTBs, using "reserved" for the
  peripherals assigned to the M33.

Best regards,
Stefano

