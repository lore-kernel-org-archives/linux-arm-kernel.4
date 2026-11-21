Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gP1rBxIK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=grBjMxpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:To:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=328eQAbB8/UBj/0mWCVQur+TyaLE3ycwXB1eGyossf0=; b=gP1rBxIKnfN1MUde+3XukceFc4
	V5GDFzimZgbqqa/2R4iSQNQe2rwCtL0FLtYlm38V8hl1Nbr0qitOHxT0MSRR16fMvZOfcl+z/GIKK
	xUWWE3jiW392fJUAzLaFqoJ6pIRTVN4Bg3iU8GrjZkybI4u3A9Pma5rTEk8gwpp0bhstzrG3qhC3L
	sLVi7qf2xeZxNagRuj580ys8dlyJVwfIOi/0lHzRkYCbCbyqwxc+ymgYv25gedFNjMnLIs3/OkzCF
	F68x8B46W59S5kPVWE4Y5FCvmGwk1qPaTcY9AJFPgNWoi1HA9PrIO/Jb42Ol/OdBBB4iy0iNjEaox
	NlSVaCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqLs-000000004Gy-2gGE;
	Sat, 21 Nov 2026 19:02:20 +0000
Received: from send197.i.mail.ru ([95.163.59.36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqLp-000000004GM-1WGE;
	Sat, 21 Nov 2026 19:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:
	To:Subject:Date:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=328eQAbB8/UBj/0mWCVQur+TyaLE3ycwXB1eGyossf0=; t=1795287737; x=1795377737; 
	b=grBjMxpcjOD/j3CtGv76oZmV1OLxoYsiARJOLquZqwiBdd5KbENI08lLzhh/5jkvJrLiCgsxvNA
	TN0e1OHhn/Iy4Eo+z/rQ4A0URMJG+sBt2x6pfxrmLA1mMQ/jPW9w7YtB2pnmT55Wo0zTX39mzUF1a
	H4qxwQUoKbNsx36i3jrcG4NA8kTK5c0P4VcuxR9i8DPGyJ+kAESk8ftudw+ctmK7bHy1+TiNlYj4z
	fesM2eBxWgNnH7iqGc2lSI4ftmYOeeD0C4jtj12/S+zja34rTjtlRCAavvZgoPeOiK0UtPnZrZXzT
	SVTz7w1xrfGcsUDwWA/YU0z+IJK15vXisgqQ==;
Received: by exim-smtp-56bb8ff957-2htg9 with esmtpa (envelope-from <mihail75rezh@mail.ru>)
	id 1xUqLh-00000000CVv-0eGB; Sat, 21 Nov 2026 22:02:09 +0300
From: Mihail Chichkanov <mihail75rezh@mail.ru>
Date: Sun, 22 Nov 2026 00:02:08 +0500
Subject: [PATCH] arm64: dts: rockchip: enable the USB 3.0 host ports on Orange
 Pi 5 Plus
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <179528772812.216453.4350843694259417297@mail.ru>
Authentication-Results: exim-smtp-56bb8ff957-2htg9; auth=pass smtp.auth=mihail75rezh@mail.ru smtp.mailfrom=mihail75rezh@mail.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F9676E14FC0BE869578A4D98A256668C45182A05F5380850402DA51C4A982F47013DE06ABAFEAF670524650630FB41EC75033F56492D606416B7E140D37D564E50
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9FBA884A7C9B8BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566B47933B1EBDEC5AFE377994DC0999922EE7036FA95A95CD7272B048948ACF3268EEF46B7454FC60B9742502CCDD46D0D4B3849D6E5CCBAFD117882F446042972877693876707352026055571C92BF10F618001F51B5FD3F9D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A127C277FBC8AE2E8B59F9E71D9C611E8C3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4931B544F03EFBC4D57B58781B77DE60D36C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A504280602568FB4625002B1117B3ED696BD5FEF5F9D7F2FD7406406D89DD9EB8A823CB91A9FED034534781492E4B8EEAD2B1D74EDA564F90EC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F4B879F07ABC7B3205CC582C1C59231D693637C1A5C6056EAC58C84B349BCC8D9E6511EDC0726525B8341EE9D5BE9A0AE6FCA2D2315E296819354E36F90C7DB2102B001CDBA470E06536EB022892E5344C41F94D744909CE24EEEB59A186B1012BC612C73171380F8A6692EB6A46169083DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWGdM+X+52RqyOphDQ8QPJMA=
X-Mailru-Sender: AC85C63E67562A65F584232FF5CACDECB95D0575A0345AC53DE06ABAFEAF670524650630FB41EC751D93E9944352DD8137C641616DBB8FEE91296853BA92DB571669B47AD10F0EF10BAD65F17811557DBDEB696115404FDD7B061B403C924453C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_110217_747180_A9444D04 
X-CRM114-Status: GOOD (  11.36  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The two blue USB 3.0 Type-A ports on the Orange Pi 5 Plus are wired to the
usb_host1_xhci controller (usb@fc400000) and its PHYs (u2phy1 / u2phy1_otg and
usbdp_phy1). All of them are left disabled in rk3588-extra.dtsi, and the board
file only enables usb_host1_ehci/ohci, so the SuperSpeed ports are dead: no
5 V is switched on, nothing ever shows up on the bus, and there is not a single
line in the kernel log when something is plugged in. The USB 2.0 ports work.

Enable the whole chain for that port:

 - u2phy1 and its otg-port, with phy-supply pointing at vcc5v0_usb20, which the
   board file already describes (a 5 V rail switched via gpio3 RK_PB7). Without
   phy-supply the controller comes up but the port stays unpowered.
 - usbdp_phy1, which is used by nothing else on this board.
 - usb_host1_xhci itself, with dr_mode = "host". The default in the .dtsi is
   "otg", but this connector is a host-only Type-A port; the Type-C connector is
   a separate controller (usb_host0_xhci / usbdp_phy0).

The other SuperSpeed host controller, usb_host2_xhci (usb@fcd00000), is
deliberately left alone: its PHY (phy@fee20000) is shared with pcie@fe180000,
which on this board is the Ethernet port.

Tested on an Orange Pi 5 Plus (rk3588, root on NVMe/SD, ALT Linux userland):
with this patch a USB audio DAC and a USB 3.0 hub enumerate on the blue ports,
the hub's SuperSpeed root hub reports 5000 Mbit/s, and the USB 2.0 ports keep
working.

Signed-off-by: Mihail Chichkanov <mihail75rezh@mail.ru>
---
 .../dts/rockchip/rk3588-orangepi-5-plus.dts    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index dd4c79b..aee1b13 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -852,3 +852,21 @@
 &usb_host1_ohci {
 	status = "okay";
 };
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
+
+&usbdp_phy1 {
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.50.1


