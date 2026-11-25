Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB2606A6A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P1J9OToz;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=R+g2sAN+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RE4nSzhPu6nNuyJJSMGMQ9YMNE34TPzHguxazmS11yg=; b=P1J9OTozTTjlbOz6hkUOJWz6qL
	P4DYec6mmPvVDfxiJyxA72Th2Zn1AiSg01TdXBwYU1XPTPN5ph+RdLFsCL8mrpmX2vjImdKjT7X3q
	ZpvfqOOtWdUqdfssAEDdmXgnnrk/8ce+fe88Ar8C9OvIzc4VzZPaYOsQnst2pMzBdmZBYaTiOeGHF
	6qnK2lRkqL0ReD+19N0l75b2iKN3jxAp+N3W98OQ6bj2ROzh07WysjVNmAVrtOSheqCouKrjL70TX
	lYKCeIyC1Ra89dlkoHtxEBZz1PMLueakJqd5wfZG/mBjOYV9h7Prw7yFXTN55YDkq3ybTT/OvUHV/
	QH6S8Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW98c-00000009FOI-3Dux;
	Wed, 25 Nov 2026 09:18:02 +0000
Received: from npq-west2-cluster1-host3-snip4-9.eps.apple.com ([57.103.70.200] helo=outbound.ms.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW98Z-00000009FNS-2YpJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:18:01 +0000
Received: from outbound.ms.icloud.com (unknown [100.84.204.149])
	by p00-icloudmta-junk-forwarder-us-west-3d-0 (Postfix) with ESMTPS id 5C421180009A;
	Wed, 25 Nov 2026 09:17:57 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id E998A1800126;
	Wed, 25 Nov 2026 09:17:54 +0000 (UTC)
X-ICL-RepId: 01a211ff-5133-705e-a341-6f0496d6e762
X-Suspected-Spam: true
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795598277; x=1827134277; bh=RE4nSzhPu6nNuyJJSMGMQ9YMNE34TPzHguxazmS11yg=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=R+g2sAN+dX9ZQzhX0AsjOBTVxobIJJVbgjIELwrmupiccO8iMYq3cHwkRX0nE+2W/HuoBSVNkYnf24cCHr+tyPGIjAD6ZPvQY/oj4peQBXNT//LDpKJkARo+TLHMfUlS8HJsrFntpMoo7nTIOwce8Jf+4NVPWPp63IaPIBwZyw15+MIR0CJ4b2MekLU2p5BJsClg0ThuP4CZ9VRiiUpX6YAev2NCspXARDbdaL2gecKS6cmruwcTzsBpGr28pf8wOEJJSFmYpCa6VLJ0vAJT7xSreLzjGhnC6OgmZldYfJCtsDSXJwglTRlrcEa+loNQMVIEDDzpw6MkgxowPsEwvg==
Received: from m3 (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 01BD4180011A;
	Wed, 25 Nov 2026 09:17:50 +0000 (UTC)
Date: Wed, 25 Nov 2026 10:17:46 +0100
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
Message-ID: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
X-Proofpoint-ORIG-GUID: 7L-1DbM7PFVkvAA3Ve1k7TBSWwo3SVaA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX29jAdByKWjWC
 MNQIzTlmJrKNzVWV54m2//FbR2nhduOrYoFf4zjYOzjVek/OANeigkcGew+NNcfHysAca1ezJ4B
 Bbh+Ryd+eKnwz1vny6jmPBSGUMbb8VU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX1ew1RDQihZ4U
 gqzd9wpFsKesraYPQpkpbJFUUWr4MInreF89q9QWG2aGtO5Vk2mOAXlZWsKUgiKuMJBPOxxkaCv
 ep7ZuOICgu4lxbHoX3hPd32qe9BYOvNPKzP0ox/mOBTRv8LBVP06a+G6uJmxDg+LJex4zRhfF64
 VlwNOqGLRNbgfRNypDje5q8juEFk9tyQ6I03hpyKNul/xeKsqJ6cNfCEuRl8CG4bKVy/uFzVxO/
 yyOk4WrTjWwdpk0MYvWewMUSxNSZSpkrRZc1e8ttGRKX/S9iTWGfyMrh1THuaFbhebXOAWy0+7g
 2v3LP1cX27qGbcfXZlWIcLsqjHCZeiFWQhS0TSKOe0r9v29l/hdgbGGr3toy7Q=
X-Proofpoint-GUID: 7L-1DbM7PFVkvAA3Ve1k7TBSWwo3SVaA
X-Authority-Info-Out: v=2.4 cv=W4GtxhWk c=1 sm=1 tr=0 ts=6b06a7c4
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=Da-wPGOzCPo0rgK0bsWi:22 a=v3ZZPjhaAAAA:8
 a=LAvkwPmW8R6kQSckoZUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-JNJ: AAAAAAABC8pesed8V/geFCW1TZj2dJcUbicq2KvDcOZ9YrjKbx3sY7Ya8S3qw3RhF2FYCF
 Wj9Jn4ryX6e+jO/Q19iIPcfeg57ZI75FynxP/ofNbtRs47aaEayS9jO+6hlhqeXrZnGdEm
 IKMb88Q+eU20dkCih9U9S4DURvAeiDp7qEwxxCjPjVkvFZCWWYUm3KjidPxqviR3/xVSZU
 oIatsaGkkESdfZiVm+ZcLbbObwqgwb6kbZH8+p1n+Xl77iAiGnPuKj0ZQjB9kZNYVdB/Wn
 VvvHHH0kXQYyiknz2FTnCgWYWD9x53HOkCu1ITiXg92iv6nVpv2SQaWI2Zoiyum6vmh4Mb
 1KThVeuKNHMzbFZKX8FWjHyTepdVvoTA8gSwSUVihYaGRN8sDdgDoaVth3X3w19pQlp22b
 WHqz95BucgpkEwPlbd2pGIIijs6kOdufEgwJE3BVAxSGGbx/jZ64Mw35Vfz7NE1xD9FWVl
 M5eJOhUETZ/VSOs8MtU3ABK9JUlqFv3mclEsFPJoHb6K/jeMKPg4Gqf98WEvCBfnwAi0kV
 KpDlD3XJFC0nH4BzTTje2tVRNSyFL1tRAMtZlxy1czc9HmoYEq4jPf2pCoShKk8WK1adyx
 SUomRl4hUiNSvUuIhGXYJAspwTDJWZM+mgWzq8BQXqE+VBil7QOnBWsCNd4d7kmih7M9L0
 9g1FStN7225K4qeDpRETWWlQnL9NzeArOnWpxcBw23o+ppYXncnXEg/g/kY940PhBaU1mo
 UYogYhVwbfsofxd3CcLadpAK+fzfrNLbKT6bH6i3Cg8wjaoZdLA6TcArjBzlwGDRVCstZw
 HAf8uKzRxnBMxA0Mkx4rWfskcT1L3GVUZu1RjwVMa8fv2W3NTCTYGdfUOq8YfzQ/CC7AaW
 e0+rgmEcyRi1NZwMTvPNmCYCu2DaTYBV6BtJ9foOLkLzoOFqLLJVmgx/3eaTCf82/av42P
 PbgSFtv+vW+xY5QSeKE9Q8oMTB+BCZKu3D5YeolV2CAu79zJ88K6EpUUN7qr7vWq0L1FbS
 2dlUeeooCl2tvXyJk1oueUjXQZmlhd2VURiIfpAcElFZR1lt1T54svOfeLlFrd6mUZqLAt
 6abvPX8acEf6qm0N3JsFNhBw9gQ3qRkKXyZwBTOVYRgUyGV/fFWjOVYRMR3iqZ2b3gsza/
 n2tkwaMTMOMwPstG6ifC6c0V1AoC5BMM4rK/OO7U0xlLk7SdHGYrd553+cnAIUb5cPvFvj
 DmYg6CFFMV6hDEmFFF/iIc4yE6Gn8JAbMHkwOpqsAWGnZ3aiWkmzv7P43uekQkQTGLSbqm
 ZZI5aLtlC0wzoxLZY6o/LMlf/ZAbjG4OZYC02wj1N7g7eTf+uVgvk9yh5QhpEhIYvhQ8TV
 ZvCmUD+6EHH1sNEpTxhwJw6Tcu0FJgMkg+hExXpUwFOghj7TUmNHW6MG1oCWtlgDynLGQC
 1r4A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_011800_739150_091C1D4D 
X-CRM114-Status: GOOD (  17.87  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> Le mardi 20 octobre 2026 à 11:37 +0200, Sofus Forstreuter a écrit :
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 922cf74c4eb8..384ff77771ea 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
> >  	 * According to the spec, tile_cols_log2 shall be less than or equal
> >  	 * to 6.
> >  	 */
> > -	if (frame->tile_cols_log2 > 6)
> > +	if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
>
> Shouldn't this be 6 too? (log2(64)).
>

The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syntax):

tile_rows_log2 = f(1)
if (tile_rows_log2 == 1)
  tile_rows_log2 += f(1)

This is also what eg. gstreamer does. I will add that to the commit message.

Best regards,
Sofus

