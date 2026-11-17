Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C28860A3809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IT6cfnAb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnZc+WN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C1C/5YLEZhF2q2t0u30/sRnCOtjRiNYQ8d7TMqadfAc=; b=IT6cfnAbYSGIe2RI8cXZyoDJuP
	UA53FkKx0JJEkeR/LKxzr039/wYVlLLSLC9UjaxiyVH2eL5z+WOLFD1kEVTy5ny2C/2zQrQIq0mJ1
	IeR2rcPMvpX6J+hsBu1B6upKibz36H1B+YT6sPBIIRCT7KiT+SzQphJu91BV8OtyP+SFkT4FM40R3
	qsJ/ZNGqyJ1NB3btrjVXMfiKxVZnXSGmrsL6zPNwm+BaRYwWwgpqtha+Qn+FyndLyRyb+MI1MI5S1
	CLNpwv4YwoYBGIXVzTTgYPcV8RXD+kXSdEnjLZJEyKpdj27kEpEVfNkuAEgqF4MzikjWof7K++VwO
	IEdzEQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITu-00000005f6K-47gA;
	Tue, 17 Nov 2026 12:40:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITp-00000005f0B-3aj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso34495365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919208; x=1795524008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1C/5YLEZhF2q2t0u30/sRnCOtjRiNYQ8d7TMqadfAc=;
        b=BnZc+WN9Npw4HQ8jNCK+64WV6MzRynbCUMEngYAirRslutjg9QMLYTu9QdNRSLYifz
         5b3OGul5iqS1y0G3hvtrrYphwGRCuYmeIh2JInAvhTwucMa+q25b+A4tkW7rik5vrMDD
         h5ytrM89ZFfxkskRo3eOw6G/kP0N0fzbujAUIdLX9EjHbLOy2I3kwnOf3O2qztwcxYRG
         FvZc+xc58Lx9RflGesT1vw4uGQsfn5dyruVLI5zujeLoeBxkxzjrL2vj/ddT2W8y6Elc
         3fcjVTsl63BnozcqrbLGQjaZsdWi0FFnC2HiwsM9iNy/ZT6sbyBhbyL/RBjWzEiAhtw1
         Jjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919208; x=1795524008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C1C/5YLEZhF2q2t0u30/sRnCOtjRiNYQ8d7TMqadfAc=;
        b=I7fXHr6BQSKqhgUPvrVH6Zrj5rJ3HU4qC3HXUEuZ2AQSaV8CKD+aVIkPmjMCCBpDmG
         wzy2qi6/mf6slJ3W9fw39mnkT48hxOI2zHKMCvxWbFriswfSYACoI/Czw/iUHPTmC3GO
         toyNJB/1IkszQMmuiNjWbLw4uP6k6HVC6gXgXxbSPhJWrmI4RZ7U+mwQMHpe6EOqdS/5
         MGh9u71uy0KgfFdc0tE9BfZ+CzhsRKv1P1cmNhIWWEAHBtVQmaA7T8Eck43+sTLU4aWw
         tTX6NBG3F3tI63ejfiwooxm89HG6HvGOO8QL9vmCDTKaWT/tPdKoJtkGo25YMTEm4ykd
         iCiw==
X-Forwarded-Encrypted: i=1; AL+hErGl67CvTBcwaVoH03BckHm0CNdWPCRhQbUTU5YiydWdLq15zoS0DHg3hmQN/7mn/3eW/iRdYqR/9gsq9MAs1AjC@lists.infradead.org
X-Gm-Message-State: APuU4Z9OxUBDuMMQRjhzmK1LY15xFTJ7eAz2kg7bLjNNFm0wZQGgQflO
	wyuljewpUSD1qtaTHQI8O2zq/ufa/TGu6VnaUs1xVDs4fuGf3DMJBWy3
X-Gm-Gg: AYBFou2p2qenfSRJgcJc52jQQPAjCr9XPQC0+KKff+R5HOzbqZBli9x2xqWDWg29GKP
	yLZFiora+uiujXTb3dxF1oHd4VEivPjWOsb7MheG16VOdgTdTRdYwS5l/RjNsLAmbrnQ/QhtCqp
	7nTQQSu0LUiRuagesHTx7RxmJ+JkRm8HDzvsKz+B+/lGl9OnJwoFceTX48A+ffSKgil9ThuLaYS
	rI2be4iizH9sjQT3mkqWoti4tru6iD2gfgRpeDffOn3rJr2mJytHOYy8rRJGdm8Uoh8FB/er904
	Tjx8k1Jvcm1bIMI/4BpCY5GDD6w44nRvf6+2bkBhHsal/95xIFhBdsS+F5xBsm0+uFYytdlUhgv
	Cg2Zp9lk2P+ARbOQUX4WeC2VuSDRDHS3W1urtQqGO+iTuih8o8jPa4RkaIs81HIVEQ3JWka3fKK
	syLCgYtQ/VFtpFr5KkDoWbHOwlb9OLuxQgmCzAgs9sl6Kc0S9BEgPz5puNMYEuagHJCWGA4MBT0
	KAI09RGvvb04wTyVXu68xj71wbk+EbOIVmOse0biLubi9xzUyUYtwDDRjBSxOiXgd7ILwTNVEWH
	B3jBXOkeeFy1dicPon01iVETyj9Inj4b6WSmalUNTpc5KHN73nX18oXh+63KJBpbjU7kWJQ9Wjt
	IhnwSpwzXUGXjODjJ3PFrrFNl0arckgV9rMTmZPe6N3OdVjxwZDRCvtg=
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb6994b88dmr165334205e9.23.1794919207690;
        Tue, 17 Nov 2026 04:40:07 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:06 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 00/15] net: pcs: Introduce support for fwnode PCS
Date: Tue, 17 Nov 2026 13:39:40 +0100
Message-ID: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044010_051563_348F9051 
X-CRM114-Status: GOOD (  33.53  )
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

At times there were 2 different implementation (this and the one
from Sean) but Sean agreed that this can be picked and used in favor
of his implementation as long as his case with race condition is
correctly handled.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_xlate.

A PCS provider on driver removal must call fwnode_pcs_del_provider()
to delete itself as a provider.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the .fill_available_pcs and .num_possible_pcs in phylink_config.
Helpers to parse PCS from fwnode are provided
fwnode_phylink_pcs_count() that will return the count of PCS entries
described in the firmware node and fwnode_phylink_pcs_parse() that will
fill a preallocated array of PCS pointer with the actual available PCS
(ignoring the one that still needs to be probed).

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be available.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

It's worth to mention that OpenWrt is currently using this on
Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
already ported in staging tree for testing.

Also realtek is using this and proved to correctly work.

---
Due to the introduction of Sashiko and the introduction of
the notifier, a major reorg of the different scenario and capabilities
parsing was needed. This is to make the bot happy (in theory, but
it never is) and try to improve the state of the code by
moving the capabilitis parsing to a centralized place trying to
address all the scenario in one place.

---

Changes v22:
- Rebase on top of net-next (no idea why patchwork reported failed to apply...)
Changes v21:
- Add fixes tag for the RCU patch
- Preserve user-disabled ethtool advertising during capability
  updates and SFP interface selection.
- Add additional kconfig select for Airoha PCS and Airoha Ethernet
- Fix wrong rcu_assign_pointer NULL in RCU patch
- Use "pcs-handle-names" as already defined (instead of "pcs-names")
- Skip phylink_pcs_disable if already disabled
- Skip phylink_major_config if phylink disabled
- Better handle capabilites from phylink_parse_mode and phylink_parse_fixedlink
- Set link_failed on late attach so that resolve is triggered 2 times
- Improve description of fwnode_pcs_get_from_provider()
- Improve capabilities tracking for PHY and SFP scenario
- Add variant for __phy_get_rate_matching
Changes v20:
- Fix double declaration error in Documentation
- Drop mutex from patch 8 for validate_mac_and_pcs
- Correctly use non lock version in __phylink_validate
Changes v19:
- Rebase on top of net-next
- RCU protect phylink from pcs struct
- Fix dead-lock on phylink_validate
- Handle possible PCS provider returning NULL (protective coding)
- Improve capabilities handling refresh
Changes v18:
- Improve handling on late PCS addition
- Fix wrong comment on airoha PCS driver
- Rebase on top of net-next
Changes v17:
- Rebase on top of net-next
- Add Review tag for DT patch
- Recalculate capabilities on late removal/attach
Changes v16:
- Rebase on top of net-next
- Add Tested-by tag
- Add ACK for airoha ethernet patch + nit fix
Changes v15:
- Rebase on top of net-next
- Fix Coccicheck  warning
Changes v14:
- Fix deadlock when fill_available_pcs fails
- Move notifier and fill down after resolve disable bit is set
- Fix kconfig description
Changes v13:
- Fix regression in fwnode_pcs_get_from_pcsspec from v12
- Fix reverse lock for phy_lock and state_mutex
- Better handle lock in phylink_validate_mac_and_pcs and inband
- Fix wrong pointer to fwnode_pcs_add_provider notifier
- Fix compilation error for new C type in pcs_provider_notify
Changes v12:
- Fix kdoc for function
- Rework PCS provider add and delete to be provider driven (instead of
  relaying on scan of fwnode every time) (this also handle
  multi PCS scenario)
- Even further rework state mutex locking for concurrent pcs list
- Restore MAC supported_interfaces validation in phylink_create()
  wrongly dropped.
- Use get/put for fwnode reference
- Fix possible unment depndency for FWNODE_PCS
- Fix almost impossible problem for PCS calibration
- Hold rtnl with PCS deletion
Changes v11:
- Rework PCS release to notifier way (fix race as pointed out by bot)
- Add Ack from Lorenzo for Airoha Ethernet driver
- Introduce devm variant for pcs_provider_add
- Better support firmware node reference for PCS late attach
- Better protect list iteration with state mutex
- Minor fixup to airoha pcs driver (flow control fixup)
- Rebase on top of net-next
Changes v10:
- Minor code cleanup and fixes as suggested by bot
- Drop devlink patch
- Add reviewed by tag
- Configure old_link_state on PCS release
- Unlink PCS on error in phylink_create()
- Use list_add_tail
- Fix typo in Airoha PCS driver
- Update phylink migration guide
- Better handle late PCS attach (idempotent function and
  add unser state_mutex)
- Use dedicated lock in Airoha ethernet driver
Changes v9:
- Rebase on top of net-next/main
- Drop early verification of supported_interface
  (it can also be provided by get_capabilites MAC OP)
Changes v8:
- Back to RFC (net-next closed)
- Address additional bug reported by Sashiko bot
  - Better handle priv interface for Airoha PCS driver
  - Better handle locking for modifying the PCS list in
    phylink code
  - Improve fwnode_phylink_pcs_parse() parsing on -ENOENT
  - Better handle error condition in phylink_create()
  - Turn down the link when current PCS is released
- Fix compilation warning caused by copy paste error
Changes v7:
- Address all the bug from the Sashiko bot
- Rename .num_available_pcs to .num_possible_pcs
- Link PCS in phylink_create()
- Correctly unregister the notifier on phylink_destroy()
- Introduce fwnode_phylink_pcs_count()
- Better handle locking in phylink for PCS handling
- Better handle unavailable PCS at phylink_create() time
- Improve Documentation file
- Other minor fixes to address suggestion from bot
- Rebase on top of net-next
Changes v6:
- Rebase on top of net-next
- Add Documentation files
- Add fw_devlink patch
- Fix some comments typo
- Rework the airoha_eth.c implementation with new multi serdes code
- Extend PCS code with PCIe and USB support
- Align schema to new property
Changes v5:
- Rebase on top of net-next
- Use the new force_major_config
- Reword some comments and commit description
- Return -ENODEV instead of -EPROBE_DEFER to perevent race condition
- Drop phy_interface_copy patch (Russell pushed an equivalent version)
Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (15):
  net: phylink: make PCS phylink instance access RCU protected
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: save phylink instance fwnode on phylink_create
  net: phylink: make phylink_validate state locked
  net: phylink: add capabilities helpers and track modified advertising
  net: phylink: support PCS provider release
  net: phylink: support late PCS provider attach
  net: Document PCS subsystem
  MAINTAINERS: add myself as PCS subsystem maintainer
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha AN7581 SoC
  net: airoha: add phylink support

 .../bindings/net/pcs/airoha,pcs.yaml          |  261 ++
 Documentation/networking/index.rst            |    1 +
 Documentation/networking/pcs.rst              |  231 ++
 Documentation/networking/sfp-phylink.rst      |   35 +-
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/airoha/Kconfig           |    2 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  197 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    5 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    3 +
 drivers/net/pcs/airoha/Kconfig                |   17 +
 drivers/net/pcs/airoha/Makefile               |    7 +
 drivers/net/pcs/airoha/pcs-airoha-common.c    | 1309 ++++++++++
 drivers/net/pcs/airoha/pcs-airoha.h           | 1311 ++++++++++
 drivers/net/pcs/airoha/pcs-an7581.c           | 2100 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  314 +++
 drivers/net/phy/phy-internal.h                |   22 +
 drivers/net/phy/phy.c                         |   11 +-
 drivers/net/phy/phylink.c                     | 1168 ++++++---
 include/linux/pcs/pcs-provider.h              |   70 +
 include/linux/pcs/pcs.h                       |  174 ++
 include/linux/phylink.h                       |   30 +-
 23 files changed, 6994 insertions(+), 303 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/airoha/Kconfig
 create mode 100644 drivers/net/pcs/airoha/Makefile
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
 create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 drivers/net/phy/phy-internal.h
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.55.0


