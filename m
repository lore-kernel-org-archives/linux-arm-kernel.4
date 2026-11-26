Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aCTBGT77;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZlrpj+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=43FuZlAs6POCjvZrAHbbrpryok64HGMb+mhfMxJg5sU=; b=aCTBGT77YNRBBb
	1iIhZQOaFkT0FrhK0Ppw8ZdsA92jPPFdEDCrySPEoPuVOE++jP1ocuRx1fyp+RhUj2jwJuk7wDP4k
	buFvRybjTviSUr4fItZfhrVqSD0OobrwvZcEhQEc6uSHiEorIBoOHiH4kBSpJzdU+frnAIcoStplq
	k188ecYgvzoYVazGyTLz3XsykM77YjSMe1DkV+MznTp6gRk9fBtBOE9EfTPbErjzE0mKWAZV+o4p7
	elXXmYoFBb9jipbRQVeKwg0MEOBdNUT0mA6Qzfp650NI4udK2liDw0/UwvQwH3O2UM1p+sf5LVJzG
	AuQMbThLSSLdIfm4TcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgZB-0000000EWpY-1n0x;
	Thu, 26 Nov 2026 20:59:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgZA-0000000EWpS-2LaZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:59:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87E1A60E14;
	Thu, 26 Nov 2026 20:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F4A1F000C1;
	Thu, 26 Nov 2026 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726779;
	bh=43FuZlAs6POCjvZrAHbbrpryok64HGMb+mhfMxJg5sU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EZlrpj+qCyV5jdtbCYTu+wtwLbjxPX0rXbtu7iIULy30wKGiuwwqW6icaY1xnf5CR
	 CaP2w2ejg1oQVeV79DRobEAfKlZY7PPxdK9hTIXqD2YF1MBoduPA4/NLGN+op5SVsL
	 v69Het4VX4rC/7gyXzad4MubX1F4/Ju7/vFXSmG/YlsPKbslXI5C6mqLt+zZ27woI1
	 69Mwcrk5WkPPk4l09e+EDuu3qgNUSY4I1ap5s0/qCTCDHHlNoWAEKsgYjJeU+xZaby
	 j59UynoouuNRkMPLST4+qKagPf0SWu2hA7wR0QROrNoqSqyzmeHwGFT1K6iG5Ts3Xj
	 P37WGlPu2BeXw==
Message-ID: <15b5029d-e1c4-4978-b602-48ff32c3400c@kernel.org>
Date: Thu, 26 Nov 2026 22:59:35 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
 <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
 <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
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

Hi, Alexandre,

On 11/19/26 17:17, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sun, Nov 15, 2026 at 04:27:35PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 11/5/26 13:06, Alexander Dahl wrote:
>>> Allows to access the OTP memory and Product UID now.
>>>
>>> Signed-off-by: Alexander Dahl<ada@thorsis.com>
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
> 
> Well, in feedback to v4 sashiko suggested [1] it is not necessary to
> enable the node in board dts, because the node is implicitly enabled
> already in SoC dtsi.  Can confirm this from testing.  I would therefor
> drop this patch for v5 of the series.  Or is it better to keep it to
> make it explicit?

Unless this node is critical for the SoC to work (I think it is not), let's keep 
it disabled in the SoC dtsi and enable it in the board dts file.

Thank you,
Claudiu

