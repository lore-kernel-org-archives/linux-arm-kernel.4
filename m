Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC43606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Je/+2WWv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMv6wg+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4yLdjzypeFQK7f+kiGZvTVFiKT3fyjUdHSNHpd8axi8=; b=Je/+2WWvd9M2i8
	KpSnyIFQ8c0/W+/J2am2COltOzjCdbK0I1tCFQZoF7ecL2X6WivZlu6b5uNrKrslBlVWLtqO55KM9
	RpLPjAYIn/YwU2+1WJQ6BDawzLXBnPhoBLtizeY8YA38OiKhZFOgngVxqAbqEUAfhLKCnPUZ3gKgr
	97/p+RXbtvNS84pMlMpzTTAlDKFpNGP3L8OtJNBLTzaeoPBybFUAvsiY33OpI4NLv1no8TErcrT3I
	y8YdKsLaAg66KOWmOOeaYmhQ1rwQ5mx3dNy9dm9+UJpboje8tYEnjOqaTLbMhcNe5iSX0weHGxKM/
	fBcBM+bOzT/su55hI5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUm2y-0000000HLVf-0sZA;
	Sat, 21 Nov 2026 14:26:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUm2E-0000000HL29-3Zam
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 14:25:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99E82457DF;
	Sat, 21 Nov 2026 14:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A791F000E0;
	Sat, 21 Nov 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271146;
	bh=4yLdjzypeFQK7f+kiGZvTVFiKT3fyjUdHSNHpd8axi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mMv6wg+KHbmuJqGJhIWcQApu6QRFrkfkUycS6llNG+mGbT5ycv6Ab0iQobuM+qVTC
	 8Hgo+eCJTAfXJPPvM4Ccku2V07hPavM/LRbvrcCezb5pRYO3bx7Gfy9s2TAhVNHFxl
	 ytnfCWbOpTWf4GUEcPN4xni5bZ6arr4EoNLkqAqtlUSa9OtSfgA+ttPSkntlXck0ex
	 PjBQtR0tSvONw8g3QTwhSUTlF/89k1gyFaHSVeSadwXJPdrDW5w17Z42mzdwSfhza+
	 egohp0KYy+UB48GYh5RqTWt9sz/D5v/XzwS3ctDzhQB8WOLxdgoTusuEI0lVFpjK9C
	 Tly0bU1iTbBNw==
Message-ID: <54d2b875-6d6b-4c0f-a1ae-3dbfdb46f4b1@kernel.org>
Date: Sat, 21 Nov 2026 15:25:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] usb: typec: tipd: Add sn201202x support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
 <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
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



On 21.11.26 14:07, Sasha Finkelstein wrote:
> Add support for sn201202x (aka ACE3), a tipd variant that uses a very
> similar register map, that is exposed over a "logical register"
> interface on the SPMI bus.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


