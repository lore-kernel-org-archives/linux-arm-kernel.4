Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D34606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dkv5ooC4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b8DEk7Uu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gGVvVvpLYm7ZFPpfldspKuf2bI8IrYyXtaX6gOidhkQ=; b=dkv5ooC4wWBIQk063atVuVAZ4d
	+Ab5D2NSgHc6ojIb9g783EiSu0Uo+YX1jLCk9UDVxcsEHiF031ZL/fs3O7RbWKz7jgPb5+ezXTUqV
	rgFSrGSgEkkzdYz6TogjH5uFn1eRykHILWSu/8vy6IWVhbIF14X4QM2qS/OxPK+nOBPJvvZNeNylo
	ZbCpLCy8mdVq7S99oLsmHvPlnpamIdw17ScjV0raabroesdwIOUY+Sc8pY3INdhs11VtFSQf1IAcE
	4xI7czEgpUYOx42pt1tPp/arZ/Up3hq5ZDneWwvKhT3P80BBVEpmyOTrb6tlOQmcNq1RHlS7f9jDs
	8NDZ97yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaSS-00000004npd-01tN;
	Mon, 23 Nov 2026 20:16:12 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaSM-00000004nny-1DwX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:16:10 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id VZ8mxvIF7V16IVaSKxsasS; Mon, 23 Nov 2026 20:16:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaSKxCdnExmi7VaSKxqD7K; Mon, 23 Nov 2026 20:16:04 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6b049f04
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=vsWaLUaKAAAA:8
 a=QX4gbG5DAAAA:8 a=CnilkIXYi68h046lorIA:9 a=CjuIK1q_8ugA:10
 a=ZAjiiiQUslnskKx8wA3N:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gGVvVvpLYm7ZFPpfldspKuf2bI8IrYyXtaX6gOidhkQ=; b=b8DEk7Uu+idXKc6ft7SaCaQkcK
	ejSdQ8UJiwxAawFbhfC9PTlB8pw4YnG17z/Epk2zE7dvOa6RGzzraxeFRy5dxUV3MWC4PM48J9xIj
	cVjAcSxIqjI5Uz9+9KH7o3YKWA5oHqVcIQ7SK2aQykH2T+yVcRi8nx5jlPC9vzdhlrP0N7J9eudmb
	msoYEA/sY+Mw/+0Tdhu1YgxrDWqZB2c7OPxO1yq0qHRsFmb7i91q5ySWCDZ0RYFIWKtzTOkTjNOL4
	bYQtXWtlsBM7NOjqK5b4PURzszae0ykfKhBy7q/7HC8Gy+W6R+oU4f/VzfgEWujme9LknjNJrFlNV
	Z0aknGxA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36638 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaSI-00000001f6j-0DzH;
	Tue, 24 Nov 2026 01:46:02 +0530
Date: Mon, 23 Nov 2026 12:16:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org, phone-devel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH v2 3/5] watchdog: mediatek: Add MT6833
Message-ID: <e9033710-6667-449e-a861-cbf3fc65bf43@roeck-us.net>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-mt6833-base-v2-3-058a0685c40c@udp0.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaSI-00000001f6j-0DzH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36638
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 54
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDi2A48cc8PMfIZSwt8e2HjxxKxNIkEdY2PhztnEE6yWB3+dDEvEmfwJBw/cezxWMys3oEOLReq8ehpkFlRSy51qyD1KxllWrW2LMz8jQFSCj0RzJrlG
 MZtbiYV6Omc0VBBVtJY6rzN9DdseownqbTJay5AQJMpD9N2g/UWdn2cW/SsKekQitc5h93pIqAe1kHfCWrrD3k7e4SuUA6aeKtD65muxY6tVxzn6r9eunY4+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_121608_625136_C6FC83BE 
X-CRM114-Status: UNSURE (   6.93  )
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 05:11:33PM +0800, Rui Cao wrote:
> From: Rui Cao <i@udp0.com>
> 
> Match MT6833's watchdog. It works as MT6589's, but its TOPRGU reset
> layout isn't known well enough to describe, so it gets no match data
> and the driver registers no reset controller for it.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied.

Thanks,
Guenter

