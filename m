Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iz2xHmsY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=kcRIO44P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vVZAOsJ2QnFk8lQNcveaLF6g+gWv7l0oVqRbIsu5Jhc=; b=iz2xHmsYAfSrbSyQkEwTd96yma
	gEIYGXyC0So1511/GYN6qq4cVGTxZOPgul/p9+fJPckJfhsjI4zbWrJqhqa0XaqLHKPr0DAZdAIVc
	RKVqnMkSxl3CTqskLNPG58FnpDxjpSofaw7YvFvyKO+feGIO24+cG5LPhNttLUmCxC8lmoaTWDKn0
	qXvqy4qvpK686mtebzVtw7Eki644QiB5Aly3mQDxswH4ol0+PXEM2P+dkQ1nsGoC+JRnOgOR+PDAh
	HpbpJh4Wgvlob2La5i1m6zF+gYrq60qklIXzFqWoPoCuSgmNi9+kkUTo6s422XU7vSx3sI3zFRX++
	Ba69S/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqaI-000000004ue-0JK8;
	Sat, 21 Nov 2026 19:17:14 +0000
Received: from send35.i.mail.ru ([89.221.237.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqaC-000000004u9-2E2y;
	Sat, 21 Nov 2026 19:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:Date:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=vVZAOsJ2QnFk8lQNcveaLF6g+gWv7l0oVqRbIsu5Jhc=; t=1795288628; x=1795378628; 
	b=kcRIO44PzYK1w7uAdbMsjnisRp5YvVcMf6jMfjURDcX/vCF0LQuwLG0RiQV50sjs4ClNYmwzgcW
	Vq3LvuDn+ZA2R58DNOCZWqOV2x/GUU+NIlJqi1mkfdLSAsCnoaAOEX7vO6opWy+caJNDmWMuteVXa
	J43QgMB/taU3Vl44TitpCVyVFrfe7vrzLKmLfsweDc6w7rBVyDLQU9KtoNEyvpo5eT3CZjEyweJa4
	n49aDGeqc8WG3fMor4hsYDKiF8e7HLbFWcnpcb5bkZrFch7+Xgp2N0pVAUEQjUPeZ6+oGo6HcaWZv
	CBoPbh7nS8VBKOrHbyN8l23b/vvr4uQa6SVg==;
Received: by exim-smtp-56bb8ff957-x4ltn with esmtpa (envelope-from <mihail75rezh@mail.ru>)
	id 1xUqa6-000000000fK-45k7; Sat, 21 Nov 2026 22:17:03 +0300
From: Mihail Chichkanov <mihail75rezh@mail.ru>
Date: Sun, 22 Nov 2026 00:17:02 +0500
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable the USB 3.0 host ports on Orange Pi 5 Plus
In-Reply-To: <179528772812.216453.4350843694259417297@mail.ru>
References: <179528772812.216453.4350843694259417297@mail.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <179528862240.218344.14341771907926360972@mail.ru>
Authentication-Results: exim-smtp-56bb8ff957-x4ltn; auth=pass smtp.auth=mihail75rezh@mail.ru smtp.mailfrom=mihail75rezh@mail.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F9676E14FC0BE869578A4D98A256668C45182A05F5380850400590D5BE415247143DE06ABAFEAF67057B0A7443CC28788FBB118A5362492031AA2292145287427F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FCFCB92DA8654BB0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F88016AB904663428638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B23CA48DC0B1C253BB2E070BE324C7D3C490043CA78221387BBB0A4F435E46E6718B35066C979671628AA50765F79006378214201309F6546C389733CBF5DBD5E9D5E8D9A59859A8B6E5E764EB5D94DBD4CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8090A508E0FED6299176DF2183F8FC7C0D6FCECA963B5CF06CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6FC29470D28DB6C4F089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5FF011A4FB947B4DE5002B1117B3ED696E2198279A622854CC66B2B37046EC955823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65981DB78CD8797B3F74602195C39E07A7B74BD195504B036CA0E6D6F29CAB152D035C9DDCA25D5231AB8341EE9D5BE9A0AAD051738BE2566C50755AB84BD45F1D29CB7035B7FCE2D886536EB022892E5344C41F94D744909CE24EEEB59A186B1012BC612C73171380F8A6692EB6A46169083DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWDFJaSEKSIvs3KofJT2Itw4=
X-Mailru-Sender: AC85C63E67562A65F584232FF5CACDEC0F2E80200DEF595A3DE06ABAFEAF67057B0A7443CC28788F1D93E9944352DD8137C641616DBB8FEE91296853BA92DB571669B47AD10F0EF10BAD65F17811557DBDEB696115404FDD7B061B403C924453C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_111709_741056_AE0C922D 
X-CRM114-Status: UNSURE (   9.51  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please disregard this patch, it is a duplicate.

After sending it I went through the history of the file and found that this is
already done upstream in commit a15d12f36eb7 ("arm64: dts: rockchip: Enable USB
3.0 ports on orangepi-5-plus", v6.14), which enables &usbdp_phy1 and
&usb_host1_xhci with dr_mode = "host" (and wires the Type-C port on
usb_host0_xhci through FUSB302, which my patch does not touch at all).

The reason I ended up writing it is that the kernel I had to make this board
work on is 6.12-based, and there neither that commit nor the
rk3588-orangepi-5.dtsi split exists yet, so the two blue USB 3.0 Type-A ports
stay dead. That is a downstream 6.12 problem, not an upstream one - upstream
already has the right thing in place, and I should have checked the file
history before posting.

Sorry for the noise.

Mihail Chichkanov

