Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4cTQje5t;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtKLDar+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKdminup
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=; b=4cTQje5t+pQnSkTtpZhpqFlhhH
	WN/Zm6+s7K1rCGhlaMSkuooYFwzApWOubIr4y3KY52yzfsO9yklHqpOYhDoSz1l3kP0BsNyCYTLoC
	Bc48q/NeGoCrhFckUjoHhuGABrOZ77lwAZdlTxN3U/tTv2Bu3uDV/lVpiuILhWU+oje8GuffvSska
	y/kamsKrKmv27BtH4hTQX3/37L+wCtPz66GeLokWdc4mz79rxjeUPosF+jdc+Lmim5LDcUXVzIQfq
	44xjjhbleprXJTAlnZoyobQEdwlAbPG+11t9zXKJOi7QaGQYbZpz/+WpY++CWbjWHkbn9CZIuwSj1
	r+BHiFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPpI-000000071G0-1Hwp;
	Tue, 17 Nov 2026 20:30:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPpF-000000071EN-0H2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:30:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6Evr1147942
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 20:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7vlfoyvYuuWOMdUXO0yz9iik
	bBUqBGSsrzrulSnQeg4=; b=DtKLDar++gsqHCZUXstn26H6vHhJPLkCPOqy9Y5o
	nG+Zaj4198Gnvhq1qwy/CwEutUbA1dJZZt7F5XNqXJFQTQVDd8p/oULQIEmmv893
	PW9MPPBhYdLIGPJ3FBEEtO8aAvRrDgc03KK2fw+Qbjt7iWtnZtZR4hiV06Ror665
	riXH8QIaxdfl+qRAz5G4YPGrc0kbWD+QeqUIKrwL7mZXKFQc0LAVDpYqisqBV38J
	KyAxKNOlHa1Pqm2oIW5mwxbg9AN+n1P3SbaUPsrC96GOdRHapJGenoGWFujboqKr
	OkSTDX69Qnwu7H9xcRcFXOZmsWYK+xY9LdMzNwuy+VRWDw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0v1fgj4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 20:30:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ecff433dso130267137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794947443; x=1795552243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=;
        b=IKdminupBS0/eFJvpXlBKO6zH+3IdMYPwRMSpdH1VzE7/gDTI9KL4DOdIMQ4Zpsa7f
         j566gGL/HntF98n7XgKcF9okn2aO11CNzvSUAkywTmfWE2N42dYsdAXSc4wu5LE3KrPY
         BqgLjmtXBrlBiF5OWpvY/1qI7DEv5igqz28chT6e9yN+kw7JFD5AWm/iiOoZNUpg0aDH
         /Fx78bVJgC2Bq8V/rxjXWD2JiyTlWFKrBgBlJaiqj13TZ90Sl9jsyZJiqenF8wJkpWAY
         6/e2FZN28v055fZBfulD5g+0JCkf/9tQ/g7KMi3yBtUNwPGKrGmOTy7BewKCcee9AJhJ
         ssvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947443; x=1795552243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vlfoyvYuuWOMdUXO0yz9iikbBUqBGSsrzrulSnQeg4=;
        b=T/+aKpGDwWE/wX7955Hv3Ew4hjwHEWpvld8Yy15T6xx+xBut5sm/o1qtjLRj0/5jWQ
         CI1jAMFijzoaF43sronNvrdS3nav0YlcwgOn3UczW5b8+hhzO3GXyB66ZgSsahd3YqJL
         elhgB22eLlHeKydXvrE9hbenfLXapaFpn4rzQz+4HTPAEhv6o9xcByCoUnUIwOwJJLNW
         XsxNy/QrKk4JW7OWLky6pT/XJ0pcgs7HOj7WzuecMwC/WxhX8O8Nr9xOaIrN1g5sfovh
         p/I6ky/dgTyzgxE6r+DcDM/Sxii8ggQF3r6E9Q7A//J5pD2AIKnLeXMR6D/5LVMVF8a7
         CzFw==
X-Forwarded-Encrypted: i=1; AL+hErHyQGR7TBn7zWOWEdL9BGb+I+Gf9pRfSEYUFX9guiaoOzEWFmoEw1k+6KEoIc+9aUKQndBx2PBP8ifcLDae1LmP@lists.infradead.org
X-Gm-Message-State: APuU4Z+z6Go6nlriE6PdjojnI6kLzfe4cSsEWjzj0T2/+aAasxNXFziX
	JY+DW8Zu20AV++ezOaOfT8Fs0440+QzMDBC75nrsIGlJhqZl9yHtiLAip9VEt4BNEUa+0rULCMF
	3zPISS4hsjxQpQ8FRDpF5skGOXR5ntf71Tr3W6FLJy1VjnNFg2aEkkcNicYgv8xx1Lu9Ttpxsc0
	1cBg==
X-Gm-Gg: AYBFou0VodI1XdeOiBZySxdQw/tu2P5JHp89/TLR5ljUUZpciGrSIKsHXaUT7drw/O6
	hKKwYOVewt1uhG6xm79m+z63oVnB1UqcF9ZrLuzjqZtTddagjsV83/TOxmislJiUrTdTosimXgv
	3mYs5aed0hHIf8aUO0TySbv9Uxfhkhhe7ADUoVZOVLChV5X76Ta+Dz7O2MPI8A8eyroqIsYR0Sn
	9qn7uowOvcse+c5Dee4tQOhwQSWMJ2tcZzoij04GYbrZseHe0W2lcVmK5cvTgOQmic6PpFCKDHa
	pIBXn/TNaCnb8p15RCgdboNz7rld1/2qZIy4gbi3HExUhfXyXqCX5t/FgNDAuMPQPpZgNVh5iqt
	8rb+ogztc9Qd5qZunicV4CMvn7SfX5mUrfatJEp2xZj0qZ3zE3ESLaWRyoAtSIJY=
X-Received: by 2002:a05:6102:162a:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d6ba376502mr69217137.7.1794947443185;
        Tue, 17 Nov 2026 12:30:43 -0800 (PST)
X-Received: by 2002:a05:6102:162a:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d6ba376502mr69155137.7.1794947441181;
        Tue, 17 Nov 2026 12:30:41 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm134085935e9.10.2026.11.17.12.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:30:38 -0800 (PST)
Date: Tue, 17 Nov 2026 21:30:28 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix num tx queues in
 stmmac_xdp_get_tx_queue()
Message-ID: <avy5ZB3rb3-T-W7o@lore-qca>
References: <20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com>
 <179493105581.3291.4118659695077688589@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yWCWm74GHDxD+Shx"
Content-Disposition: inline
In-Reply-To: <179493105581.3291.4118659695077688589@kernel.org>
X-Proofpoint-ORIG-GUID: OLYgI9fHG1_R53b_pCM2EUQ3IiEgFJbp
X-Proofpoint-GUID: OLYgI9fHG1_R53b_pCM2EUQ3IiEgFJbp
X-Authority-Analysis: v=2.4 cv=IbgSymqa c=1 sm=1 tr=0 ts=6afcb974 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=m1JEaiY4i_a_Ipqe4SAA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfXyVcb6Q0VCd5M
 wMKR/ME/YQAGgZRB9tOt323Aug50nDsoVJ9OHnEOJSbSKLXrD8lzsHp3ywCMh6q6+l4h5ZyVUFq
 WEXDekZoB0BwMsNmm9FwRK56B0WVIlqcAsdHOy2fVpu/EbPGDsjWhR2e6QqjLEtKj9JQD2tf0Zk
 x90t8zs6MaI/7XVHZngOve4hczfg67qpx8daAbNBP9QR9Gy9ZG/Kln1u7IP2PuN3NGwSpr3BkpM
 LT76lAgQuohmgczgzC9rQ6agT8pSAwPmlxZWZBTDT+Rh4c/yikgbOxd4C1i5MV4kJ1T2tYcOJQd
 mNtWRGgRMgY0PG3XMMlUPAKEgg0gG0C+nMKishirQ7NqAR/MVmShW1pnBZ5kOvIAI3aMGRvDJ9Q
 UhTteKp3HjTybLq48I1i8VonpugC+xdi9VYlkuNYZbZxOiXAmRxVmQBXcZnZUxJIBVRarD38d+W
 XaSpDuDAmYQZvyyknnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX91LuWw5/wYgY
 aoAcKNsA4w2H0b+aG0TaXTDHoL/RpwJt1uck+OFXN7NuARiYprOn+oP4pdjwU6ENBrOq41WEh7k
 SvEW4r8+fJ2iGRpKehxFh4GxcbOSvY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_123045_244743_49AAA627 
X-CRM114-Status: GOOD (  25.90  )
X-Spam-Score: -2.8 (--)
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

--yWCWm74GHDxD+Shx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

I spotted the issue during code development

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

This is a theoretical issue found during code inspection

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested it on a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--yWCWm74GHDxD+Shx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavy5ZAAKCRA6cBh0uS2t
rNETAQCGRKCmAlCPuoAkpL6wjQtgkOfJzgxEyivCOFRwznyeRgEAzxJ/oRmVS7b7
WgSqNYbiG98w/qgPodTtfuyjaYDQTws=
=BxgR
-----END PGP SIGNATURE-----

--yWCWm74GHDxD+Shx--

