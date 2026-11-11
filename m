Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF1606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HE0XzK/Z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZceZ+7Nr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2qK2aGIye1HX+d13MbJVaOFMfu42XDmA8K7eVHsgcko=; b=HE0XzK/ZVmfUk/ZxJ+9bdc3gvP
	q/mrP7klSQ17n3jHL62ZhDl13IDregcNH8w5ewOI7akAlFfBtwgiQJan32xCFAro4/Lug6+NB718Y
	M5yky8k84Dj8++An7r00RYzSJviO4GVr1Q4HmkRY64tLI/zEKIq7gqNmxx47qd7Ea5mxpVao7rmRj
	SAx9EHf3Ecf3/w1wHANplKnFW8uENZNqa2ozjjGpLOKORx7cm6QnM1AFzmRZtTs1DxpeTtqUTAbmr
	uBqh4ReO3Rw4121fOfIb9QVnesRUbY2/956+zyONhWDeKOV0uKyBMRYMzsgzVH6QtxvwUbl9weJl8
	ew3u94mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAHp-000000075Zr-2M8i;
	Wed, 11 Nov 2026 15:30:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAHo-000000075ZL-1IiQ;
	Wed, 11 Nov 2026 15:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB49605FD;
	Wed, 11 Nov 2026 15:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161A11F00A05;
	Wed, 11 Nov 2026 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411055;
	bh=2qK2aGIye1HX+d13MbJVaOFMfu42XDmA8K7eVHsgcko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZceZ+7NrP14MGcOiFM03sWRRXENDOZXhRkrZ4/QNcwj0xgc1F2yz+EKuOVWVsLofE
	 u0OHQ8NXUqLQ7+yp1A6dFg68NjW6YMDNv3IeeCbWh5CiU1Tz9xHU5zG9U03lSQiORd
	 KJw2bdKFd96en/Ce4PI72efbnUG+P3uu9IrQO0ebQ0TQC1puayuZbQVxlDKOt0YmPF
	 MQnqVaIXvvxEWhqoeQyNCRlEN6SJVxpi65+6a65b+dsrtXNiXMStsIYpTIMxMXoo00
	 d8lX5ioZrmSNmSC0zdXs5BEYxoAz3VnWjm5ueWZPbzPUopJxulr4J++5L1VROtFWwk
	 i0z027nC4re2A==
Date: Wed, 11 Nov 2026 09:30:49 -0600
From: Rob Herring <robh@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 00/12] nvmem: Add Raspberry Pi OTP nvmem driver
Message-ID: <20261111153049.GA2640564-robh@kernel.org>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <66bf8629-225d-4f65-84dd-67f02aa4cab6@kernel.org>
 <y2ocj374gtrwf3ozptwgmqhsy5k26y45uwlbgtyvvmlxkftc2k@gjs3jsbxbm4w>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y2ocj374gtrwf3ozptwgmqhsy5k26y45uwlbgtyvvmlxkftc2k@gjs3jsbxbm4w>
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

On Wed, Nov 11, 2026 at 09:14:32AM +0100, Gregor Herburger wrote:
> On Wed, Nov 11, 2026 at 09:02:19AM +0100, Krzysztof Kozlowski wrote:
> > On 11/11/2026 08:23, Gregor Herburger wrote:
> > > Hi,
> > > 
> > > This series adds support for the Raspberry Pis OTP registers. The
> > > Raspberry Pi has one or more OTP regions. These registers are accessible
> > > through the firmware. Add a driver for it and add updates the devicetree
> > > for the Raspberry Pi 5.
> > > 
> > > ---
> > > Changes in v9:
> > > - Fix sashiko comment and use fwbuf->count instead of bytes in memcpy
> > > - Link to v8: https://patch.msgid.link/20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de
> > > 
> > 
> > Big series sent three times within last 24 h. Please slow down and give
> > people chance to review your work.
> I sent v7 with a missing commit and based on an wrong commit so Sashiko could
> not apply the series. Sashiko found an issue in v8 so I tried to fix it in v9.
> 
> I have the impression people are not reviewing stuff as long as sashiko has
> issues. So I wanted to fix those things quick.

Like many things, depends on the maintainer...

sashiko found something on every patch? I only look at the binding 
patches, so it is not going to matter to me if sashiko points out issues 
on driver patches. Vice-versa is probably true too.

Rob

