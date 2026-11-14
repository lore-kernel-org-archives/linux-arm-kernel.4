Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E80606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BT41mNX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SVxCG2kr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=; b=2BT41mNXs4CZlrrq5/H4ORr3Dj
	lJpFm9gLYNd3NdINeIYCzTnaKrNXPzymZqf8gG01+VpBWyK8wl5Vsd8OlXwWipG3CzIO+iS5Xqyc6
	sKcNUMDtY3ukMhAvutwIYjKm1B5ijEUTifdKzQewZS6N++m8ApuV5xb8iKp8PCQIjNJ6YFa3nb1Pw
	c5oFJ6QqWGi059N8VdLeZLNUyiCEcR6oNrqfhx04yPnqX2i0KZLIineFNze/uGlR8v2h80aX3nkj6
	G0WGOFo4w+UwZoWMONec4YKPW35+TJQ+Nd/5tIoi+xhlbf28PHSygz2IGVE1kN5g6AtzVXsaDwNsv
	2KMPFTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGqw-0000000GTsS-05fZ;
	Sat, 14 Nov 2026 16:43:46 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGqu-0000000GTs1-0RWT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 16:43:45 +0000
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id SBHdxH7Mm4vCDSGqsx0Rfp; Sat, 14 Nov 2026 16:43:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGqsxwpeEYskhSGqsxZPsp; Sat, 14 Nov 2026 16:43:42 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af88fbe
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=epKNRfmuhR7F8Vwm0QkA:9 a=CjuIK1q_8ugA:10 a=mshYcpSARKEtRsk-hzoo:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=; b=SVxCG2kr7z5DKmWxqdACAVC8tT
	TzjxGc6gS2U69moDMvRhuy6WnbXByk0ENPHIIbUQgYgQ6Er1IqMT9Qaam8hV/MmHhySBk/CLDoiJ6
	r7L+w4voiV/7kzlIKAx0kTxHye5lNYscZ3wL6vug7TA+mtpM8+it9LTXzpfx+lyJgobvyXsswna8Y
	11PTvsi4K8fV+F6d6Ug98pxwPQicoYTxIjI+Tjn1HiKvTR3uMqNWP/AJPl8nRQYO8n8aBRojvQlGy
	eIvYQSdnMPPvXkxPKCQrPjuNXAfZkDk1Kc5ySLpoI8B0zKyVIiQJhZBC04qm8GskMGCdKO2pWaDwf
	fBHA2VQg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34420 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGqq-00000000JsV-3dMt;
	Sat, 14 Nov 2026 22:13:40 +0530
Date: Sat, 14 Nov 2026 08:43:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Message-ID: <ce3ad183-3940-40a3-b4bb-c92deb8a7ef8@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGqq-00000000JsV-3dMt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34420
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 85
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCBzmDVXIS9qmHnL5UIBeUERo9EfZ8IrybVwyq9tt+sLS+KZCdZX2V7QUsg1rgv0RLLhPXJhcS7Gi2EqQfmnawf1TWQxQPJyIC/dAPRyC3rgdxhxE0W/
 AxatYc0nYY2O6fR8ArQPMrqig/Uz0SyRtNyOovpa0YRy9ACGlho2hDN3f6MZOMowYadYnFRumTxnhJ0T+LoOVrJz1nnH6tJ8TUXo344Sj0Tqix+WaAKqN265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_084344_214290_19601E0B 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 05:12:45PM +0100, Robert Marko wrote:
> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

