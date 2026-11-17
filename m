Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD54606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CvViA7gw;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=Osfs4yAE;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=CC47ZTMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=; b=CvViA7gwAKK8naP2DAi9Q+YSB4
	cJnFoWi5HvWHaSm9D3Ufbn6dABYpoJ8TLlojxgeqn5Fi0kT997tl6nebTHo1j603Obqttw0Vasrtt
	3W4NsVeLP7jgca3O51QFGgC08BaA9pal5mzG9oQaCEPneAnAA4IWDEqSmyC9hjgrCTKzm5Gj3PHhm
	e+vYCW4wEvpnAAhvrvfezy15LGm1FDRpjPhsSQWlioX4ufO4HEi2gzm+HCeWci+AgxxyP87hiLjz5
	PblGBI/js4cc5thmlALtx0GLSkNfDUivV/+ZF5lKZUVqsJjRUfSUFi3SQ7H2NRmvk+KYoAl3iUhOO
	+wLuq1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRpg-00000007F4t-0oVI;
	Tue, 17 Nov 2026 22:39:20 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRpd-00000007F4G-3DsM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:39:18 +0000
DKIM-Signature: a=rsa-sha256; b=Osfs4yAEPBTvxOlHIS9gTliHty7sECWi442MUl6m94BF76iTAydV3SSqFJkT0ozKs5E9x/frlA54amxyvvGJEWtXEBl4DYKFtUbLB0kKGrJkLpx2CKsGk4l+cCVNI4tTgFkmuEe1AX7ZfEtqXqnUOOouuoQQ7PpGwN/9zyKXsljUOIc1QJjkVsvm7ADk2mClY7oTE8/JXSDSsdMFDv5dNn+UEZa8oKc6fzLbs9nlRTZdmWQRsksPshv/7gppjR4F5Ja76M7tu7lCUMKheIL/NH+1plvejI1nJXI6RZH0h3Kx9lPBV51BJVkfbmsfNOYfhyaTV221YpYzGz/9xOv8ug==; s=purelymail1; d=sverdlin.org; v=1; bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=CC47ZTMgbns6WCHZTbtn/MKMfgXerrYcMlMZt0M5fmqyTyHzNLajBOhjot6aZhBiyAlS5DADaOz883TZWEMo0TjEFpxGpmjIEjjnU98Qdd9KNlme3SIDJ7GeGO6CJrKOqD8mTvJzGXKXHVQCd9Klm1KPSKKfGXw4UuN4Ga/eew36Kb6jOX/+UXPH51S65PjFL7pz6e1k1UsEqIxinUVczhZbco2ntZHQtqEGmN7iMekzBz+ktJecZfdPmsGdCAlY0hPl5/87pWOWKdArynsyJWh0eDE5lWhgOi0WY22aphjD1v6upDFDy7vK+0Dh6Qe9MPA08A9xGXZ4bHhXQjwguA==; s=purelymail1; d=purelymail.com; v=1; bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1496021118;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:39:10 +0000 (UTC)
Message-ID: <f25ef379708f06f459dd7c4576ac6c47694fc74b.camel@sverdlin.org>
Subject: Re: [PATCH 4/6] arm64: dts: allwinner: a100: Add A133 speed grade
 efuse cells
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:38:58 +0100
In-Reply-To: <20261104-a133-series-v1-4-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-4-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_143917_871380_A425CF23 
X-CRM114-Status: GOOD (  10.66  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rajan!

On Wed, 2026-11-04 at 22:40 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> The A133 speed grade selection also needs the chip marking ID (SID
> offset 0x00), the word at 0x20, whose low 12 bits the vendor BSP calls
> PCPU, and the word at 0x28 with the bin extension bit. Add nvmem cells
> for them at the offsets the BSP uses. The H616 reads the same kind of
> marking ID at offset 0x00 as its speed grade.
>=20
> The cells are used by the A133 OPP table added later in this series;
> the A100 OPP table keeps using only the existing 0x1c cell.
>=20
> Claude Code (Anthropic) drafted this change and its message from the
> vendor BSP device tree; I reviewed it and checked it with dtbs_check.
>=20
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20

