Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D071606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZAc1qso;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gj8hRzTn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=; b=gZAc1qsomNTxK9ivjiKgadwSBu
	DPTTl1FIIQX7z4I8lO6WX7IkLATdVKsYIMhS4mQIihOXmJAVRRuNtz97env6bgmR0tK3UavCR2GUY
	NzCZMixwdKb/ftPvBDhaC7GoiiHdgp/oefh2MKvTX0W/uuuR2uGpGUqHp95UV2FoERkaW6kKo6y3B
	XC4DiY/VsLHs2o/JFG97Ef8bxxRLDY3noRnPLzWzWkR2oDWGUTEiR26lg+Rel9la4TJk4zpqZ4eU6
	EmlFNV2evI3B0nheMsIR4hjcVOeMPkYaah2gD8yB3FIRiX1eVWI1Jz1fKOVkIe08Jw+yR2QQ6qe6p
	g9x8KrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGrc-0000000GTz6-0guq;
	Sat, 14 Nov 2026 16:44:28 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGrZ-0000000GTyY-1QPp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 16:44:26 +0000
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id SCCpxf2C7yb4YSGrXxgIol; Sat, 14 Nov 2026 16:44:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGrXxY88KFhzrSGrXxM5nc; Sat, 14 Nov 2026 16:44:23 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af88fe7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=XYAwZIGsAAAA:8
 a=VwQbUJbxAAAA:8 a=kXeqfPWSxjI9BzV32rYA:9 a=CjuIK1q_8ugA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=; b=Gj8hRzTn1Qv0Tn1Cegteb7ykRg
	3Hr2Vfh7fpwxl20G5C4GVXr8t+0XKtiV7ZqbCd2yHexKZzfWUZYM3R5hHl5XrOW5G9oak497GShdn
	BBYXj/2UERRK5fN4T8CaUVeZ4++MBC+gttXXZyDqHbjQ7WEQqFhpz7d8NCI1VaYO843flyVufD+xS
	4HjIoqy84YJX7r4sxJb2ShtqSgnPYLOpZiyaxjnJBuv5T/9/FWDxM46FWzVN0bxaiLjFPBIYPmfj+
	gVh4BAT53kfZnql1hENZ3zYXsA5OHF/dcat9cJEeMKmLay68bzxmJfUAq9ThWq38wkXQ9e0VJxN3P
	6ZTS4Rcg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48162 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGrV-00000000Kmi-1jrj;
	Sat, 14 Nov 2026 22:14:21 +0530
Date: Sat, 14 Nov 2026 08:44:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <db9e90e3-9d06-4b23-b373-9a78e2598ea5@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGrV-00000000Kmi-1jrj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48162
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 101
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNoe+BB4sFOXs+D/gOiL0iZibkCXJqF3gw4ibnKFLmccuH+NN7uit07s7o5ZizxDXdH5Z1MP8p+8+JA17C0Gx4ETna8BtP+Eu/qw12ALJlHwexeb5g19
 5JeQnlg1/UgI5/PV+Cx8Ja0Iqofwc4iX883wSBCX9GFUKMQ7dJjB97DjJXMpGfTZ++qtRf0CULKPMFQI6YVrYaRcT1uE4JExYUE1osrQC/LhOzLDSDrx6XCe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_084425_404356_09B5D4BB 
X-CRM114-Status: UNSURE (   3.91  )
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

On Wed, Nov 11, 2026 at 05:12:46PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

