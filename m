Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bboADoP6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+7DdWah;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+7E8OX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=; b=bboADoP66UVM7TBTSK6JqIdpOq
	ncELasMBpg1i1UP1XgewirGX6f9Q/roXgusOLXbZo+HiDDboeAPIhVh79d4DNfehr3E15fRXtMnpq
	lbvzJTIjz14SHQYGkcn3Xyj2pNuTPz8q6V6MNeEOg8z23atQgC1DN76GXnMyHQxY5DRyAaFBq6o38
	z1iv+xxQEBkhcAFoMOCvQV8er9tcTp/G+InRp3Dbd9Df6fLj4XuILd4KS3MkWJx1O5hxk1xn1UZvf
	l/R4uZYJ971n0CsRPnk8nbuGDssS0ANgYRBdf395m4qaNfhq54P5sL388uwtFLdI6XgX0iOdTrdSo
	Y9NCzKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOE-00000005yrK-3G6s;
	Tue, 17 Nov 2026 13:38:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNi-00000005yQV-2d8W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1xV14188023
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJl
	HltnUqZI=; b=Z+7DdWahleE9zjEReBe+yBqicGp/8SJ25VPhe+igSR1gfb//QV5
	dt64SIs4Eqeg7tkO+qUWxMXx9wXAao2jrCv4kiHrk8SLv7Uh9YR+DLgd/8OvFjPt
	vlRlfymql0SRcE4cL/7pZXbJW8atqjytfoJTzFVwLMCZzku7MjiiXftVY9aVPGmL
	H11XiTr50Qg/LG68uX3dIqWuW86jTV1CIU3J8IuQgLGQfexphBd6LweagIg++9Mi
	Im0aJUQwMkXqTeaQyd7fydAAAfelBU9eViRHRfAiMQCP7j68qs2iC8CFuvfHxoms
	Rk666fHoxPhoRjrJyhVyBbMZimtXPnSjYlg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0bbjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:37:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so1776317137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922673; x=1795527473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=c+7E8OX6u0LE+TaAqjZx8xGQQw7B5wZ2GGAFPJNcB0xzU8Z5IroB8dstuFDCzGe7/F
         JkXd7QQ+FThv9O1WmFcVvyn+a+iK9hGmjHZS49X18LDAbabHlPNnELzA8zX5Lq9gu+A0
         AWCH9rOLh66xrU7PKymt69UTDJD1hfnOQk+W+HA4G71qNIDOcZH0bC+yxFn348wdM9vJ
         zYmtByzAcnzlN22cSBgB5TTpEvSPzY7JZTo2KyBP083j5nX+O6rfk35b7eJbquUCJPng
         oF5NcZJmXNMPpLHkk/CVx12hwTHN2VXtdxpVrjq196yHwEzEaIhK4qPf9zo9n5uvzC+0
         vcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922673; x=1795527473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=mjG4XewjWKNBZYEPBS6928awGId+bPWOt0BR44qK00D6Gc10e9KBlZ9iZcJHMMWLpq
         sJBhbnlcwJPDY8EgMfZIHhTKY1EqcqYgCLZyE1EMVDW7ha+ShrnfMc1RtTCl4McuITvR
         go9G/cS6TwUBb9l/7qd4G4IDxOv9Bl8fjsFGUyrO10LS0gcbEDvb2KMIljpHz2YOUYE1
         H3M/Bga6iegrarqEayuNxkv3PIYsXq3mIlIk18F5xtWP9YE56Cj7SH7yWVzZ2RIw2iRf
         LdRrg8jDZpHlHOfiHy07RZtYjtyS7EyL3rHay2ZlfV3b8zYqdb6pOEcnB4Xd9XD5Ejoc
         mk8Q==
X-Forwarded-Encrypted: i=1; AL+hErEK7lVz5cYxc3VpKdiUwoEBQ6CVi8nenrCqRLFppUfsF6Mn1gbeSy6DHIOjZiDP0cC8uggRSWxLY9gNfGBdc8+S@lists.infradead.org
X-Gm-Message-State: APuU4Z+4+Mtg5QZBkx9fr1gTR0qy26zM+acn6e8RSW1rkhanqaVknJ0C
	pF7mTi2gwqWMstd+oSzg8928WiQ7vhJqP9D+iUVSeUMniP/gF+dgEvt5Mz7bf7TlYd97QLwqFof
	bj4YkBb0vJauqNeBAA5S6LLMIw51xnjn1sJ+vd1NDMV5ltdbptVejhlU1OHNh4uFbiAN12T4vVC
	59iA==
X-Gm-Gg: AYBFou30sCqUd+B0jmRdaYnbDYlC7WWVqLu/AH4rIAKTABnufnI0aSUT7vj36MdM/eZ
	/xUiszBk5UELhUwjpdHxqpiAhx+CYEx6mm+d1TNqeydlntH5RFvucpeBuPafTGG95oxgrTjmOIE
	ZyZzGFwAh3Q037ZT4W3Lob1redBAYqdWr+OtDHEOBdKNtoMOjEzgquFyFFpRqVziqQCvOBxAHZ6
	8df3qOr+cVMrDDC16docDzjqWSkcaHQ83U8HXSJeqczk72CPYQ1LYEfEXsCfff80DU3mggzTAax
	5vhYh5nFPc02ldjBwtPwzkX61CoZCZ2q/p39MwY2RJaEq2W5gJA/0G9uGp0tRETtU+qNISEzbOk
	Bm1uLyf0laNUo6BGV/BRw0Yi7ra/lq/xAqWQXqokZwo0jdCJ4uYW1WWscdNFMxA==
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204890137.32.1794922672928;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204876137.32.1794922672491;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm363557105e9.2.2026.11.17.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:37:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented, unapproved eeprom0wl alias
Date: Tue, 17 Nov 2026 14:37:48 +0100
Message-ID: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KUARb3HaDROzrv5JSilip/gDz3du0UgzF+jvXH3wQPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FiruQeX2tTdJV30K4WI1UvRRI/HmlqoCummp
 PBnowpwgNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxYqwAKCRDBN2bmhouD
 16cAD/9Y32TUYVWX2itfzXqfwj+HaT1mKaqlNLyFNgErt02EbqE2d45iZRm3tYjOmGd7sSfurzB
 ang5KxY/ODKC3zCqv81d4GO9DYSRkmhMe5jPUO0dGRHrTM5gZS88TBRuo+Sd+ZRkEWxXQS2lyW1
 ZekLVtSiz4sNov3DDJVU+3TkMSjPqPRxWlCOueUnwIkBwBqfvp7sqc17AxKSSWU1cIFvUsrBWhb
 /wZ74/0sWzUh8TCXj0R8mRow4L6tcAd4qx2v1+zEsE4mLqSR1xVcHyrUDvl3vU4vuY5kPGC1YuY
 eX6SR/+rBABU5y1J7eT9Ew5mCzwC/lAWVzGfdTPZEutPUuo8H2JIlXu7FNcDo2aNt1lqdOp9mZP
 mgWFTUMQ4Ha7whyHHo0bkzSgFT4snr2Nu2YjHmy5VUtHzT9j0OwTWk4M0QnXoIXpeqLVjA4EIsg
 tp1M+LdQscKlhldX6JLm/qIq8m+5dJ8B9YrbeRFGDbDWfYGJS0hoeke53Be/B+vtSX4wpflQuRs
 FL725hDKrQZpqp/mh/GPXNk79i7mLQ7eEcV4VQd5kxuFlJo0HJo8PNPLNkDjbo0r/KkxuohlchR
 2SLxrA8Wh0a0+A1ExANJ5fnzJxK+YGRgjOg0HxN44xhFZkOTb9BIMOTyAD4KIsbB9subow5zB2c EW+DlVro+SvUoFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX5ceTh2W8CErX
 FORAn4NU7SNLpEIh6Cks6JenE4h9g8ZMsyy4CSw0lVqdvR39e4RSeTHBAsbdq5V/xqU1NJYtkDC
 FCMaxAhjjlbdnre890huVZ49ulFrGGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX0g9R81lMxY7z
 Cw6SjjlPsxjFFQhujQxdEmouUWcf+lRKj0NdXQXdQPZdY6lT4c+n1XuxkDpvMP218KGClm2P2J4
 RqRU94Zcz3tmv4P5za2NRs5jqbnUO5Cj4DCbGPhnDQI2aUHZZDa2OXY28gz29+Tv5CuFPsDON8q
 hg5WCN0svRCOf3qYbB8FwweJfT0MhufRvuS76eg6ODjyH41KBpl9qUZJwce7aB+yxw1e7YpxJxF
 l0leUzUborDULFrZH+i6YMeDAy56CdDpZT+fHeKqeIFUvUik3Il61tqaVl1gTdDTjb39cSKJt+h
 jSSkCSzpaEXd5zdVwHPGuKd0IcuXfs4gWQRWdWSKBmTb5LVpUmMZJrZYGd0C/NRg74c70rDD829
 wrgLW2vIujyogDR5PsEjiW2jUzQMT79hHHuGJ8rBRArBcrvIu+LxSv86u6+TEWdIPFW6C9PlxOC
 N9h8V7MnOeGI3dV7p5Q==
X-Proofpoint-GUID: XrEKAzo9CAF4VDim3vvK62Rh3rhCM_mG
X-Proofpoint-ORIG-GUID: XrEKAzo9CAF4VDim3vvK62Rh3rhCM_mG
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc58b2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YQ1LzMIngL_xikbxVdIA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053755_108871_7B74103C 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The eeprom0wl alias was never approved by Devicetree maintainers,
because it was never documented as actual ABI.  There is no in-kernel
user of it, although there might be U-Boot.  External DTS users cannot
rely on undocumented ABI, thus these are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5795b352fccf 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -10,7 +10,6 @@ aliases {
 		serial0 = &usart6;
 		serial1 = &uart8;
 		eeprom0 = &eeprom0;
-		eeprom0wl = &eeprom0wl;
 		rtc0 = &rv3032;
 		rtc1 = &rtc;
 	};
-- 
2.53.0


