Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0D4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQJGJW5w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TmqaGjf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BEJxwQaGNWxQ+Lrjj9osjOpBls40KMYzaU0/7fZX5w4=; b=PQJGJW5wEM1Zlnio7QSpibsoy8
	s2ji74Jb2mNzmxU9rUNTgER+Px0Fu6XcHVXN+sRyfC0tJJc268oJDUK4Oj2nLgguoUqmCZ/0psmNO
	+BqdIqDfz17VZ9EwH/xbsyHmXcEPHTLuGQQicw1RfJIYCDBxs22Pzfgy98IRw0uztaIP02hws5GqW
	Fze8HQ8yidUmUpmNSgSA1buenAKab30ClmPuGlMYD0jcqj6bjgqMuEV4wtdni4WKI2PsE48C8AMMd
	nzRaz1FOSFsQUFpRlQ3hv57UJfetEAGgsnnC3AF+pZu8Bq4o/+PGB8iHYAbcqDHhAUHFBFAd0kMSW
	/PU8RMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSq-0000000F7Yy-2dXp;
	Sat, 07 Nov 2026 17:44:28 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSn-0000000F7Xn-1QKB;
	Sat, 07 Nov 2026 17:44:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794073455; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNANYMnjVjL8AQHETfCzsnCl7WDB7yl3eUtihPbGKy2hR1W99SMKsRX5irR+XSVNTg4auA1yoi9JVXZM+D9y/8l6ZB6hVHfDLPFe9pzVZsbuDEK4u/Ee0B4Lp7w5Dy4aAev+9l8N524Oy127oUc1+w0N7twpcwozRqKhF8TClaQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794073455; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BEJxwQaGNWxQ+Lrjj9osjOpBls40KMYzaU0/7fZX5w4=; 
	b=QzfgnuvkvyJt+IsqFqXpPHmcUb4OOjyMLdvhsFGV9t2oBHBWVJJVcKDQ0CKGuU9Lzw4c/0AK75v41554Cisoj1x1Xb7O8ZAPyZ33UqR/0PMjvy/LIQ86SH/tqEemrAY2ztmpQhGKJY8X090klgzLbSGYI+VGgsFUDxN3T6AraSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TmqaGjf3mJ5lZkS6OkEIKM8NO2XQWhbpiaR4nMZwYsnExEJISJyswJTitIlX1z+BhFQxWIYGPXkn7+SwWf4FNVSXB9BvWc95I6YEZiv5Jxeo9gSdRIPj2UmiQXnIkb5xD7cjksPiImCj95uZpJnOwceeE08YX6CMZksjkxcP7MQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=BEJxwQaGNWxQ+Lrjj9osjOpBls40KMYzaU0/7fZX5w4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794073454367647.3084136884058;
	Sat, 7 Nov 2026 09:44:14 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 62D63180370; Sat, 07 Nov 2026 18:44:07 +0100 (CET)
Date: Sat, 7 Nov 2026 18:44:07 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jingoo Han <jingoohan1@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v9 9/9] PCI: dw-rockchip: Add system PM support
Message-ID: <au9hRvuc09yjcUpd@venus>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
 <20261105-rockchip-pcie-system-suspend-v9-9-a2e55846649e@collabora.com>
 <179406940043.65886.12399286680610211664.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kzwu7rhoz7aasxwz"
Content-Disposition: inline
In-Reply-To: <179406940043.65886.12399286680610211664.b4-reply@b4>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.65.33
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_094425_495475_B3CDAE62 
X-CRM114-Status: GOOD (  17.77  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--kzwu7rhoz7aasxwz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 9/9] PCI: dw-rockchip: Add system PM support
MIME-Version: 1.0

Hi,

On Sat, Nov 07, 2026 at 10:06:40PM +0530, Manivannan Sadhasivam wrote:
> > +static int rockchip_pcie_suspend(struct device *dev)
> > +{
> > +	struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> > +	struct dw_pcie *pci =3D &rockchip->pci;
> > +	int ret;
> > +
> > +	if (rockchip->data->mode =3D=3D DW_PCIE_EP_TYPE)
> > +		return 0;
> > +
> > +	if (pci->suspended)
> > +		return 0;
>=20
> This check looks wrong. 'suspended' flag is only set at the end of
> dw_pcie_suspend_noirq() and is used as an indication to glue suspend call=
backs
> to turn off the resources or not. here is no way this can be set at the s=
tart
> of tne glue suspend callback.
>=20
> I'll drop this check while applying.

I added this as a workaround in v8 for the issue Sashiko found in v7
(see down below). We probably will never see it in reality, so I'm
fine with dropping. Thanks for applying.

Greetings,

-- Sebastian

-------------------------------------------------------------------

[Severity: High]
What happens on a subsequent suspend if rockchip_pcie_resume() fails?
During suspend, dw_pcie_suspend_noirq() sets pci->suspended =3D true, and
rockchip_pcie_suspend() then powers off the PHY, disables clocks, asserts
reset, and disables rockchip->vpcie3v3.
If a later call to rockchip_pcie_resume() fails (for example, if
dw_pcie_resume_noirq() returns -ETIMEDOUT when dw_pcie_wait_for_link() times
out, or if regulator, PHY, reset, or clock initialization fails), the error
unwind path in rockchip_pcie_resume() disables the clocks, asserts reset,
deinitializes the PHY, and disables rockchip->vpcie3v3 while pci->suspended
remains true:
drivers/pci/controller/dwc/pcie-dw-rockchip.c:rockchip_pcie_resume() {
	...
	ret =3D dw_pcie_resume_noirq(pci);
	if (ret) {
		dev_err(dev, "failed to resume: %d\n", ret);
		goto err_clear_rst_gpio;
	}
	return 0;
err_clear_rst_gpio:
	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
err_disable_clk:
	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
err_assert_reset:
	reset_control_assert(rockchip->rst);
err_deinit_phy:
	rockchip_pcie_phy_deinit(rockchip);
err_disable_regulator:
	if (rockchip->vpcie3v3)
		regulator_disable(rockchip->vpcie3v3);
	return ret;
}
Because the PM core logs the noirq resume error, clears is_noirq_suspended,
and continues resuming the system, won't child PCI device resume and the ne=
xt
call to rockchip_pcie_suspend() read APB/DBI registers while the controller
clocks are disabled and reset is asserted (causing an SError on ARM64), and
then call rockchip_pcie_phy_deinit(), clk_bulk_disable_unprepare(), and
regulator_disable() a second time?

--kzwu7rhoz7aasxwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrvY2MACgkQ2O7X88g7
+pqeNBAAhRH8o+2ntbrtErJ/GWtKAM5B0MClHc1gk/Ul2QDBO9lU9J9e4/uz6nw5
mhklQHDcVO9bkj/dcwwm1YpnDGJYyrLmuVbvvJktiKHGTzx0JbZ0oV3w3pFZFRps
z3vGd+lJbxigSkYN7CxYyLFXIZI5JPE8saZwNmjTIwiqdQWTcpa1cCQxIiZAmucr
qX8FWCgDyqV1R2lvZRKuzjaZ085Rm9qLTJp9VqHIKQdSO/5fCf+4c3Ukf3LpneDS
TRrfSky9T93bKyDcaCWKXDGH6RpGetZiGozmYOWO9bxxnPfmUIQpBDreIo5AxpDx
JtdH1J1+p2HGjOmtsID58bxzj14/N7So62YdmVFhtsVaURj06zxKdqavNKbojHev
bebeU29+uMHIRCVOwoRzdWZaFmgXxQsRmE8mei7B0N6DFarEcaFWOQWfPOMqqqqe
2eCMUSIxWEufq1RlcIOEhlEoWOWmWzBxikPzQfjM2S0efEzO7Bo3JR7boDiGuJ/N
NckH1Mt1rTSytm7iizrapv0TYq7F+Qa574LefEIrRCEGWxRAXGC5uB02sAKZ30/Q
9K0ZhiaROggfmjYA+hkOeX6q28H7me0FryEvLzMQJnKKXDrAHQldwdV/mA7t66L7
27pmlJaSvgo/R6ePbnjZrYLy0XRe9b/Kfk2TsAi06u6sU18BDz4=
=tNHG
-----END PGP SIGNATURE-----

--kzwu7rhoz7aasxwz--

