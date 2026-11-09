Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775D606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+ZPoerC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtTG9ifD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Lhf1oVBUzjNJ7L7ccHNHY1ZkhYM/kcm/f0+29KNaVA=; b=N+ZPoerCaSTLBG+yKhjXUdDth3
	hgtX3nXQvRZRgCeuGE4OoZSUO0MdXv4BR+qX3OsvKJEgcO4bA1O564IdYaC5fCp9M/LvsvZLv6g4U
	q94MuPvAOm3oiINdDgrlb/k2x3WNrv48iTYhpYr5PstjXghNMop3ZUDSU3Xc3Vn012oLeDpMSdMm7
	XUDHnjpfM+M97ucdxiRaqHzR/nHLDWmZABGuxCWbhqaVz0nfJ8pcrOG8KCSrvfQzVbrFhxkFmns72
	P3h3vFWvCoJJUz7A5zzZqLJSZMm0uF5pngRTHzGSVgrvf5wFzWeZ1hFdDEWiLOwngnbfY9nnSaMc2
	+qd7vSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLrp-00000000HWq-26z0;
	Mon, 09 Nov 2026 09:40:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLrn-00000000HWi-1fvR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F7CE62F47;
	Mon,  9 Nov 2026 09:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4C31F008A2;
	Mon,  9 Nov 2026 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217242;
	bh=2Lhf1oVBUzjNJ7L7ccHNHY1ZkhYM/kcm/f0+29KNaVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EtTG9ifDodRJOB8+ggrbktVkdLsbeY5l9Na1ZYAYCT7eR82Y6sNwlWI/eG/en0noi
	 JSpIWOTHxTwTIE7NHoNVf6PsnQ0zppP4KuhUtbi9zGn/zMOULsj+ucbZFdY2a1jwsl
	 v0O2J7YTtmbqKkeKQPBPpDib4I5asR0YE5pMZXdC3mw9q50gZ12zRAIBQsRu1H8s1i
	 hoKkCzsx1JCbWYKpcpIXGfv2v2QLTjYPk9KZEx2ub2qpWQzRrVj/a/Q1w4MACE1n2F
	 J2um1Obp+kO+Urv3+ywFth1u58w/P/MyaxaNw2AkZR5O+g+N3Pd8qPM+7nLYsH3GD+
	 Goc8ooofKzdvg==
Date: Mon, 9 Nov 2026 09:40:38 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: raoxu <raoxu@uniontech.com>
Cc: linux@roeck-us.net, cristian.marussi@arm.com, marek.vasut@mailbox.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable temperature sensors using their
 sensor IDs
Message-ID: <20261109-cheerful-panther-of-abracadabra-aa907b@sudeepholla>
References: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
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

On Mon, Nov 09, 2026 at 04:28:54PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> scmi_hwmon_probe() groups sensors by hwmon type, so the index in
> scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
> Passing that index to config_set() targets a different sensor if the
> platform exposes non-temperature sensors ahead of temperature sensors.
> The intended temperature sensor can remain disabled, causing subsequent
> readings to fail. If configuring the wrong sensor fails, thermal
> registration of the intended sensor is also skipped.
> 
> Use the firmware sensor ID, as the read and thermal registration paths
> already do, so temperature sensors are enabled correctly.
> 
> The patch was reviewed and the commit message expanded with OpenCode
> AI assistance.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

