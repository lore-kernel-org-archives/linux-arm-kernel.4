Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D7606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uxxoB8od;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=URemDzHK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=; b=uxxoB8od9fFkolHHemraGIYfr/
	MHp06GcY5JPEvdUbWW7GbTjbT3Riw2AZsClmpLB/T7df4eRNUmX4CzkYdIBpFlRsVackvb7UpZ/b3
	HvYqcq7KYTEguu304VK4QGo64AV/hnL4qRYz0hEltJ8IvyNl2ACuYRkW/1YCzVhjS+7RPpRZd20hi
	oOcIEuWaMU0u7flnWZ6Dn2UbMlhLymUo7Jb8ep8K68PgIRgpoIJ2tdJFnRh16u00BA5pzvVNlmq5D
	0/zVtjktoRStsOsTbOCX2hoq+Zt+Nm0EbEhrx1moADV1Sm+SsWB+oc0lknkMAB3y3ARxMe80K7bbA
	e7z/Nfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSYV-00000009bQh-2gPH;
	Thu, 12 Nov 2026 11:01:23 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSYO-00000009bOn-30Rw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:01:22 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C9F882006B6;
	Thu, 12 Nov 2026 12:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794481273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=;
	b=URemDzHKEzKZcnP7DjrGSnTIbB+oeJByzv8XRaSrlgT8co8cBGHlaxatK11/OiwLQjD02n
	kqtN1MC3/trS60DEKaJb70+t5aFBoVQ6qJC9qtt5gvvssXbl7A947lH28ifO/5LWfIADMN
	7fu6W5jJ0q3mwlzHoUhucNr+H+k8LXwk6fmnVM5Z2zgrBqJ+itIztq/WsTIQXPDEndPBxV
	jd6h9QK9psBGt1L4jO06MwaUgJV4+FvEOwU81HnCexs/dNq8HnTXcK7RUnck34WqkjWqCq
	2kMo8UUGyv6fqhvoVCoM2Ni6mhlFbA+x77T1dAGImGNmdPYHR9PCFIuwE+w0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794481273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=;
	b=UmGtaCRCYjlXOvbswqJo9Dat/MXlntHcwqR8H8hDVXCnl9IoCxtDOREtoBlfIDHF7kaBEP
	dvtW5fhL+63iOUjWgyFMZp1X/OYUPb1neskeNGRSGHcw4b/KYufYCia8KyIiCiM3UWMT9v
	W85fwtNcGlFeriGWXnNQ2QltcW3/hlkv4YkUl567X/1gSWhsL2bVvyr7bTfqfQlfVg65Yf
	syms4eoKqDFjyuqWYTXplSRxvq+cgOA4drt4Hvoaxtascc0QI21mZBnxmkRiRnUTywUj2Z
	ajQno5aehJg4bvo53+73gqSvHiY1pLJzVJt0INUJ7j5jyNTDmfQ1kNwCkDIq2Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794481273; a=rsa-sha256;
	cv=none;
	b=Ai9KxwBTPCcDV6TYrJCuErsOOfOOfzW1wE3RWpqq+ab71qjc3A1IhuRczj6EOS4qWALgh/
	yDNySx8EPKavx3ozZO9rg+YDpDRHFwm1qNfujKu25/UxzeG6O+xobkRPlwSBXzS0LNNhOE
	vQzijG6J4tMsvC+ys+NIAntIAPD/6MZlh5TGhP2Y0qred00RuentUsGqOPn8t+GrPiCnh3
	VqRRRuMWVICmPl+c3hitlrFndCNMzSf/bwNAndRG+rRJEd2A5EgdKyjaI/Zp5OlNowrxVr
	10WsDpBFu1K+b8XTafOG1ogbtIOqpIQb2d95rikjNL02ILfGatSTX4ty1w4gBQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <146c8dcecd2b976b5a9cd57e4db57dba66e12ea3.camel@pengutronix.de>
Subject: Re: [PATCH v14] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Nov 2026 12:01:13 +0100
In-Reply-To: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
References: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030119_390214_F6F34F73 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mo, 2026-11-09 at 23:08 +0300, Stefan D=C3=B6singer wrote:
> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> [...]

Applied to reset/next, thanks!

[1/1] reset: zte: Add a zx297520v3 reset driver
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Dfbcd5a23e147

regards
Philipp

